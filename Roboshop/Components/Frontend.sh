#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then 
   echo -e "\e[31m script is expected to executed by the root user or with a sudo privilage \e[0m \n \t Example: sudo bash wrapper.sh frontend"
   exit 1
fi


echo -e "\e[35m configuring frontend.......!\e[0m \n"

echo -n "Installing frontend :"
yum install nginx -y         &>>/tmp/frontend.log
stat() {
    if [ $1 -eq 0 ]; then
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
fi

echo -n "starting the nginx:"
systemctl enable nginx       &>>/tmp/frontend.log
systemctl start nginx        &>>/tmp/frontend.log
stat $?

echo -n "Downloading the frontend component:"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat $?















>>'COMMENT'
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf
COMMENT