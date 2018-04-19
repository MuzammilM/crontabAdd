#Author : MuzammilM
#Adds an entry into crontab
COLOR='\033[0;31m'
reset=`tput sgr0`

if [ $# -lt 1 ]
then
        /bin/echo -e "${COLOR}No arguments passed."
        /bin/echo -e "${COLOR}Adds an entry into crontab"
        /bin/echo -e "${COLOR}Execution : crontabAdd \"* * * * * /bin/echo input2\" ${reset}"
        exit
fi
last="$(/usr/bin/printf "%d\n" `/usr/bin/crontab -l | /bin/grep id | /usr/bin/awk '{print $1}' | /bin/sed 's/#id//g'` | /usr/bin/sort -n | /usr/bin/tail -n1)"
new=$(($last+1))
read -p "Please enter appropriate cron comment: " userInput
if [[ -z "$userInput" ]]; then
        /bin/mv crontab crontab.backup || /bin/mkdir -p /home/$USER/logs/cronLogs/ && /usr/bin/crontab -l > crontab && /bin/echo -e "\n" >> crontab && /bin/echo -e \#"id"$new >> crontab && /bin/echo "${@}" >> crontab && /usr/bin/crontab crontab
        /usr/bin/crontab -l
        exit 1
else
        /bin/mv crontab crontab.backup || /bin/mkdir -p /home/$USER/logs/cronLogs/ && crontab -l > crontab && /bin/echo -e "\n" >> crontab && /bin/echo -e \#"id"$new " "$userInput >> crontab && /bin/echo "${@}" >> crontab && crontab crontab
        /usr/bin/crontab -l
        exit
fi
