#!/bin/bash
#update date daily at 6:00 AM
#Author: Solomon Amos

DATE=`date "+%d-%m-%Y %a %p %l:%M %Z"`
Weather=$(curl wttr.in/?0?q?T | awk '/°(C|F)/ {printf $(NF-1) $(NF) " ("a")"} /,/ {a=$0}')
time=$(date +%d-%m-%Y).png

echo -e "* $DATE   : $Weather" | tee -a ~/shell_scripting/README.md

date +%d-%m-%Y >> ~/shell_scripting/weather.md

curl -L 'wttr.in/Scarborough=.png' -o ~/shell_scripting/img/$time
 
echo -e "\n![](img/$time)\n" >> ~/shell_scripting/weather.md

cd ~/shell_scripting
git init
git add .
git commit -m "update Today's log:)"
git remote add origin https://github.com/alvintee97/shell_script.git
git push -f origin master