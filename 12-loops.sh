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
    echo "Installing $1 is ...Failed" | 
    exit 1
    else
    echo "Installing $1 is ...Success" | 
    fi
    
}

for package in $a

do
 echo "installing $package"
done 


