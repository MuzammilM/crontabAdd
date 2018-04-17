mpuser@alpha:~$ more bin/shellscript/crontabAdd.sh
#Author : MuzammilM
#Adds an entry into crontab
COLOR='\033[0;31m'
reset=`tput sgr0`

if [ $# -lt 1 ]
then
        echo -e "${COLOR}No arguments passed."
        echo -e "${COLOR}Adds an entry into crontab"
        echo -e "${COLOR}Execution : crontabAdd \"* * * * * echo input2\" ${reset}"
        exit
fi
list=` echo \`crontab -l | grep id | awk '{print $1}' \` | sed 's/#id//g'`
last="$(printf "%d\n" ${list[@]} | sort -n | tail -n1)"
new=$(($last+1))
read -p "Please enter appropriate cron comment: " userInput
if [[ -z "$userInput" ]]; then
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo -e "\n" >> crontab && crontab crontab && crontab -l
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo -e \#"id"$new >> crontab && crontab crontab && crontab -l
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo "${@}" >> crontab && crontab crontab && crontab -l
        exit 1
else
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo -e "\n" >> crontab && crontab crontab && crontab -l
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo \#id"$new ""$userInput" >> crontab && crontab crontab && crontab -l
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo "${@}" >> crontab && crontab crontab && crontab -l
fi
