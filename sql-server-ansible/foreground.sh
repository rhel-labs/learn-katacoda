!#/bin/bash
while [ ! -f /root/post-run.log.done ] ;
do
      sleep 2
      printf "."
done
clear
echo "Ready to start your scenario"
