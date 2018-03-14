read -p "Please enter appropriate cron comment: " userInput
if [[ -z "$userInput" ]]; then
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo "${@}" >> crontab && crontab crontab && crontab -l
        exit 1
else
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo \#"$userInput" >> crontab && crontab crontab && crontab -l
        mv crontab crontab.backup || mkdir -p ~/logs/cronLogs/ && crontab -l > crontab && echo "${@}" >> crontab && crontab crontab && crontab -l
fi
