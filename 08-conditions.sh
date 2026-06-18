#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]; then
    echo "Given Number $NUMBER is greater than to 20"
elif [ $NUMBER -eq 20 ]; then
    echo  "Given Number $NUMBER is equal to 20"
else
    echo  "Given Number $NUMBER is lessthan to 20"
fi