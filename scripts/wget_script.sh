#/usr/bin/bash

#-----------------------------------------------
#  The following script will check the status of
#  the URLs using wget
#  Will send the output to the csv file based 
#  on the output
#-----------------------------------------------

time=`date +"%m%d%y-%H%M%S"`
#date '+%m%d%y_%H%M%S'

#-----------------------------------------
#  Define the location of the WGET script
#-----------------------------------------

SCRIPTSDIR="/shared/users/monitoring/shell_scripts/wget_script/"
DEVURLS="${SCRIPTSDIR}/devurls.txt"
QAURLS="${SCRIPTSDIR}/qaurls.txt"
SITURLS="${SCRIPTSDIR}/siturls.txt"

#---------------------------
# Specify the environments
#--------------------------
environments=( DEV SIT QA )

"${environments[@]}"
for j in "${environments[@]}"
do
> ${SCRIPTSDIR}/all_env_${time}.csv

echo " ${j} F5 URL, STATUS " >>  ${SCRIPTSDIR}/all_env_${time}.csv

for i in `cat ${j}URLS`
do

  successcnt=`/usr/sfw/bin/wget --no-check-certificate $i 2>&1 | grep -i 200 | grep -vc grep ` 

  if [ $successcnt -gt 0 ]
  then
     echo "$i,UP" >> ${SCRIPTSDIR}/all_env_${time}.csv
  else
     echo "$i,DOWN">> ${SCRIPTSDIR}/all_env_${time}.csv
  fi

done

${SCRIPTSDIR}/csv2html.awk ${SCRIPTSDIR}/all_env_${time}.csv >> html_url_${time}.html

done


