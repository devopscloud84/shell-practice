#!/bin/bash

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

# first arg --> what are you trying to install
# second arg--> exit code

VALIDATE ()
{
     if [ $2 -ne 0 ]; then
    echo "$TIMESTAMP [ERROR] Installing $1 is ... $R Failed $N"| tee -a $LOGS_FILE
    exit 1
    else
    echo "$TIMESTAMP [INFO] Installing $1 is ... $G Success $N"| tee -a $LOGS_FILE
    fi
    
}

for package in $a

do
 echo "installing $package"
 dnf list installed $package 
 if [$? - ne 0]; then 
  dnf install $package -y &>> $LOGS_FILE
  VALIDATE $? "installing $package" $?
  else
    echo "$package already installed.. $Y skipping $N"
 fi 
done 


