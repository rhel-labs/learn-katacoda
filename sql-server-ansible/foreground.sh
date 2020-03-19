!#/bin/bash

n=1
while [ ! -f /root/post-run.log.done ] ;
do
      if test "$n" = "1"
      then
	      clear
            n=$(( n+1 ))	 # increments $n
      else
	      printf "."
      fi
      sleep 2
done
clear
printf "Ready to start your scenario\n"
