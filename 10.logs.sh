#!/bin/bash

USERID=$(id -u)
##LOGS_DIR=home/ec2-user/shell-logs
LOGS_DIR=var/logs/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"

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
    echo "Installing $1 is ...Failed" | tee -a $LOGS_FILE
    exit 1
    else
    echo "Installing $1 is ...Success" | tee -a $LOGS_FILE
    fi
    
}

dnf list installed MySQL &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "MySQL is already installed...Skipping" | tee -a $LOGS_FILE
else
    echo "Insatlling MySQL"
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE MySQL $?
fi 

dnf list installed nginx &>> $LOGS_FILE 
if [ $? -eq 0 ]; then
    echo "nginx is already installed... skipping" | tee -a $LOGS_FILE
else
    echo "installing nginx" 
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi
