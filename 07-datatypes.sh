#!/bin/bash

Num1=10
Num2=30

Sum=$(($Num1+$Num2))
echo "Sum is :$Sum"

#Array

MOVIES=("RRR" "VARANASI" "PUSHPA") # index is always start from 0
echo "Movies are : ${MOVIES[@]}"
echo "First Movie is : ${MOVIES[0]}"
echo "Second Movie is : ${MOVIE[1]}"
echo "Third Movis is : ${MOVIE[2]}"