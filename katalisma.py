#!/usr/bin/python

# Katacoda to Instruqt converter


# v. 0.0.3
# Support for notes in first challenge, fix NodePort
#
# v. 0.0.2
# Support for bulk migrate with git submodule
#
# v. 0.0.1
# First draft
#

import os
import json
import yaml
import re
import shutil


# Instruqt will order the YAML and sanitize the YAML content (e.g. assignments)
# so there's no need to order the dict nor optimize the escaped block for non-YAML

track_d={}

visualEditor=False

#Reads the homepage pathway all in the intruqt-template dir
with open('instruqt-template/homepage-pathway-all.json', 'r') as hfile:
    hdata=hfile.read()

courses = json.loads(hdata)

for course in courses['courses']:
    print(course["external_link"])
    pathway = course["external_link"].rsplit('/', 1)[-1]

    print("Creating or updating Scenario : " + pathway)
    
    if not os.path.exists("instruqt"):
      os.mkdir("instruqt")
        
    instruqtDir = "instruqt/" + pathway
    
    if not os.path.exists(instruqtDir):
      os.mkdir(instruqtDir)
      print("Directory " , instruqtDir ,  " Created ")
    else:    
      print("Directory " , instruqtDir ,  " already exists")
  

    pathway_id=''
    if "pathway_id" in course:
      pathway_id=course['pathway_id']
    else:
      pathway_id=pathway
    
    title=course['title']
 
    track_d["title"] = title
    track_d["slug"] = pathway
    track_d["type"] = "track"
        
    try:
      with open(pathway + '/index.json', 'r') as mycourse:
          course_data=mycourse.read()
    except FileNotFoundError:
      print("Path " + instruqtDir + '/index.json' + " not found, skipping")
      continue
    
    course_json = json.loads(course_data)
    
    track_d["icon"] = "https://logodix.com/logo/1910931.png"
    track_d["tags"] = ["rhel"]
    track_d["owner"] = "rhel"
    track_d["developers"] = [ "rhel-tmm@redhat.com"]
    track_d["private"] =  False
    track_d["published"] = True
    track_d["skipping_enabled"] = False
    
    #handle time migrations
    if "time" in course_json:
      duration=re.match('(.*?)(-(.*?))? minutes', course_json["time"] )
      if duration is not None:
        time=duration.group(1)
        if duration.group(3) is not None:
            time=duration.group(3)
        time = int(time) * 60
      else:
        print("Time not found " + course_json["time"])
        time=300
    else:
      time=300
    
    #handle level migrations
    difficulty="intermediate"
    level="beginner"

    if "difficulty" in course_json:
      difficulty = course_json["difficulty"].lower()
    else:
      difficulty = "basic"
    
    if level == "advanced":
      difficulty = "expert"
    elif level == "easy" or level == "beginner" or level == "basic":
      level = "beginner"
      difficulty = "basic"
    
    track_d["level"] = level
  
    l_challenges=[]
    d_challenges={}
    
    src=r'instruqt-template/config.yml'
    dst=instruqtDir + '/' + 'config.yml'
    shutil.copyfile(src, dst)
   
    #handle background and foreground scripts
    if os.path.exists(instruqtDir + '/track_scripts'):
      shutil.rmtree(instruqtDir + '/track_scripts')
    shutil.copytree('instruqt-template/track_scripts', instruqtDir + '/track_scripts')
   
    if os.path.isfile(pathway + "/foreground.sh"):
      os.system('cp -fr ' + pathway + '/foreground.sh ' + instruqtDir + '/track_scripts/setup-rhel' )

    if os.path.isfile(pathway + "/background.sh"):
      os.system('cat ' + pathway + '/background.sh >> ' + instruqtDir + '/track_scripts/setup-rhel' )

    if not os.path.exists(instruqtDir + '/assets'):
      os.mkdir(instruqtDir + '/assets')
      
    if not os.path.exists(instruqtDir + '/scripts'):
      os.mkdir(instruqtDir + '/scripts')
    
    introText=course_json["details"]["intro"]["text"]
    with open(pathway + '/' + introText, 'r') as myintro:
      intro_data=myintro.read()
    
    intro_md=re.sub(r'\(.\/assets',r'(https://katacoda.com/rhel-labs/assets',intro_data)
    track_d["description"] = intro_md
    
    #copy all the assets to the scripts folder
    try:
      os.system('cp -fr ' + pathway + '/assets/* ' + instruqtDir + '/scripts/' )
      print('cp -fr ' + pathway + '/assets/* ' + instruqtDir + '/scripts/')
    except KeyError:
      pass
    
    #Handle terminal
    if course_json["environment"]["uilayout"] == "editor-terminal":
      visualEditor=True
    
    l_steps = course_json["details"]["steps"]
    l_size = len(l_steps)
    time = int(int(time) / l_size)
    
    isFirstStep=True
    
    for step in l_steps:
        slug = step["text"]
        slug = re.sub(r'\.md$', '', slug )
        
        if not os.path.exists(instruqtDir + '/' + slug):
          os.mkdir(instruqtDir + '/' + slug)
          print("Directory " , instruqtDir + '/' + slug ,  " Created ")
        else:    
          print("Directory " , instruqtDir + '/' + slug ,  " already exists")
        
        
        d_challenges["slug"] = slug
        d_challenges["title"] = step["title"]
        d_challenges["type"] = "challenge"
        
        with open(pathway + '/' + step["text"], 'r') as myassign:
            assign_data=myassign.read()
        
        md=re.sub(r'`{1,3}(.+?)`{1,3}\{\{execute\}\}', r'```\n\1\n```', assign_data )
        md=re.sub(r'\{\{copy\}\}',r'', md)
        md=re.sub(r'\{\{open\}\}',r'', md)
        md=re.sub(r'\(\.\.\/\.\.\/assets',r'(https://katacoda.com/rhel-labs/assets',md)
        md=re.sub(r'\(\/openshift\/assets',r'(https://katacoda.com/rhel-labs/assets',md)
        
        d_challenges["assignment"] =  md
        
        if isFirstStep:
            l_notes = [{"type": "text", "contents": intro_md}]
            d_challenges["notes"] =  l_notes
            isFirstStep=False
        else:
            if "notes" in d_challenges:
                del d_challenges["notes"]

        #Enable terminal and web console tab
        l_tabs = [{"title": "Terminal", "type": "terminal","hostname":"rhel"},
                  {"title": "RHEL Web Console", "type" : "service", "hostname" : "rhel", "path" : "/", "port" : 9090}]
        
        #Enable code editor
        if visualEditor:
          l_tabs.append({"title": "Visual Editor", "type": "code","hostname":"rhel", "path":"/root"})
        
        d_challenges["tabs"] = l_tabs
        
        d_challenges["difficulty"]= difficulty
        d_challenges["timelimit"]= time
        
        dictionary_copy = d_challenges. copy()
        l_challenges.append(dictionary_copy);
        
    track_d["challenges"] = l_challenges
    
    #write out yml
    with open(instruqtDir + '/track.yml', 'w') as yaml_file:
      yaml.dump(track_d, yaml_file, default_flow_style=False)
