package main

import (
	"html/template"
	"log"
	"net/http"
	"os"
	"path/filepath"

	rice "github.com/GeertJohan/go.rice"
	"github.com/husobee/vestigo"
)

type SitePageData struct {
	CTA  string
	VirtualHost  string
	KatacodaHost string
	KatacodaUser string
}
type TrainingPageData struct {
	Site SitePageData
	Name  string
}

type ScenarioPageData struct {
	Site SitePageData
	Training TrainingPageData
	Name  string
}

var templates = template.New("").Funcs(templateMap)
var templateBox *rice.Box

func newTemplate(path string, fileInfo os.FileInfo, _ error) error {
	if path == "" {
		return nil
	}
        if fileInfo.Mode().IsDir() {
            return nil
        }
	templateString, err := templateBox.String(path)
	if err != nil {
		log.Panicf("Unable to parse: path=%s, err=%s", path, err)
	}
	templates.New(filepath.Join("templates", path)).Parse(templateString)
	return nil
}

func renderTemplate(w http.ResponseWriter, tmpl string, p interface{}) {
	err := templates.ExecuteTemplate(w, tmpl, p)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func getSiteData() SitePageData {
	return SitePageData{VirtualHost: os.Getenv("VIRTUAL_HOST"),CTA: os.Getenv("CTA"), KatacodaHost: os.Getenv("KATACODA_HOST"), KatacodaUser: os.Getenv("KATACODA_USER")}
}

func scenario(w http.ResponseWriter, r *http.Request) {
	pageData := ScenarioPageData{Name: vestigo.Param(r, "scenario"), Site: getSiteData()}
	renderTemplate(w, "templates/scenario.html", &pageData)
}

func index(w http.ResponseWriter, r *http.Request) {
	pageData := TrainingPageData{ Site: getSiteData()}
	renderTemplate(w, "templates/index.html", &pageData)
}

func course(w http.ResponseWriter, r *http.Request) {
	pageData := TrainingPageData{Name: vestigo.Param(r, "course"), Site: getSiteData()}
	renderTemplate(w, "templates/course.html", &pageData)
}

func trainingcourse(w http.ResponseWriter, r *http.Request) {
	pageData := TrainingPageData{Name: "training/" + vestigo.Param(r, "course"), Site: getSiteData()}
	renderTemplate(w, "templates/course.html", &pageData)
}

func traininghome(w http.ResponseWriter, r *http.Request) {
	pageData := TrainingPageData{Name: "training", Site: getSiteData() }
	renderTemplate(w, "templates/course.html", &pageData)
}

func trainingscenario(w http.ResponseWriter, r *http.Request) {
 	pageData := ScenarioPageData{Name: vestigo.Param(r, "scenario"), Site: getSiteData(), Training: TrainingPageData{Name: vestigo.Param(r, "course")}}
	renderTemplate(w, "templates/training-scenario.html", &pageData)
}

func main() {
	templateBox = rice.MustFindBox("templates")
	templateBox.Walk("", newTemplate)

	router := vestigo.NewRouter()

	router.Get("/", index)
	router.Get("/static/*", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))).ServeHTTP)
	router.Get("/training", traininghome)
	router.Get("/training/", traininghome)
	router.Get("/training/:course", trainingcourse)
	router.Get("/training/:course/", trainingcourse)
	router.Get("/training/:course/:scenario", trainingscenario)
	router.Get("/:scenario", scenario)
	router.Get("/:scenario/", scenario)

	http.Handle("/", router)

	log.Print("Listening on 0.0.0.0:3000...")
	log.Fatal(http.ListenAndServe("0.0.0.0:3000", nil))
}
