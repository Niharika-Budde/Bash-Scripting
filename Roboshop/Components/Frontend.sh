#!/bin/bash

set -e

USER_ID=$(id -u)
COMPONENT=$1

if [ $USER_ID -ne 0 ]; then 
   echo -e "\e[31m script is expected to executed by the root user or with a sudo privilage \e[0m \n \t Example: sudo bash wrapper.sh COMPONENT"
   exit 1
fi


echo -e "\e[35m configuring COMPONENT.......!\e[0m \n"

stat() {
    if [ $1 -eq 0 ]; then
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
fi
}

echo -n "Installing COMPONENT :"
yum install nginx -y         &>>/tmp/COMPONENT.log
stat $?

echo -n "starting the nginx:"
systemctl enable nginx       &>>/tmp/COMPONENT.log
systemctl start nginx        &>>/tmp/COMPONENT.log
stat $?

echo -n "Downloading the COMPONENT component:"
curl -s -L -o /tmp/COMPONENT.zip "https://github.com/stans-robot-project/COMPONENT/archive/main.zip"
stat $?

echo -n "clean up the COMPONENT: "
cd /usr/share/nginx/html
rm -rf *                    &>>/tmp/COMPONENT.log
stat $?

echo -n "extracting the COMPONENT files: "
unzip /tmp/COMPONENT.zip     &>>/tmp/COMPONENT.log   
stat $?

echo -n "sorting the COMPONENT files: "
mv COMPONENT-main/* .
mv static/* .
rm -rf COMPONENT-main README.md          &>>/tmp/COMPONENT.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Restarting COMPONENT"
systemctl daemon-reload                 &>>/tmp/COMPONENT.log
systemctl restart nginx                 &>>/tmp/COMPONENT.log
stat $?















