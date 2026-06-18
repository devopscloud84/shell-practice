#!/bin/bash

USERID=$(id -u)

# check the root access or not

if [ $USERID -ne 0 ]; then 
    echo "Please run the script with root access"
    exit 1
fi

# echo "Im continuing..."