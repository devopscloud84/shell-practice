#!/bin/bash

### special vars ###



echo "All variables passes to script: $@"
echo "number of variables passed: $#"
echo "first variable: $1"
echo "script name: $0"
echo "who is running this $USER"
echo "which directory: $PWD"
echo "Home Directory: $HOME"
echo "PID of the current script: $$"
sleep 5 &
echo "PID of the background command running just now: $!"
wait $!
echo "Line number: $LINENO"