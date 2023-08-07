#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then 
   echo -e "\e[31m script is expected to executed by the root user or with a sudo privilage \e[0m \n \t Example: sudo bash wrapper.sh frontend"
   exit 1
fi


echo -e "\e[35m configuring frontend.......!\e[0m"

echo "Installing frontend:"
yum install ngnix -y         &>>/tmp/frontend.log
if [$? -eq 0]; then
   echo -e "\e[32m success \e[0m"
fi















#--> need to install this

# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx