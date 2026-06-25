#!/bin/bash
set -e
USERID=$(id -u)
##LOGS_DIR=home/ec2-user/shell-logs
LOGS_DIR=var/logs/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N=R="\e[0m"

# check the root access or not

if [ $USERID -ne 0 ]; then 
    echo "Please run the script with root access"
    exit 1
fi


for package in $@

do
 echo "installing $package"
 dnf list installed $package 
 if [$? - ne 0]; then 
  dnf install $package -y &>> $LOGS_FILE
 
  else
    echo -e "$package already installed.. $Y skipping $N"
 fi 
done 


