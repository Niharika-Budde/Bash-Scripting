#!/bin/bash

#USER_ID=$(id -u)
<<'COMMENT'
if [ $USER_ID -ne 0 ]; then 
   echo -e "\e[31m script is expected to executed by the root user or with a sudo privilage \e[0m \n \t Example: sudo bash wrapper.sh frontend"
   exit 1
fi
COMMENT

echo "configuring frontend"
yum install ngnix -y
















#--> need to install this

# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx