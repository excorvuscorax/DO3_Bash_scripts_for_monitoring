#!/bin/bash

fileFunc="function.sh"
fileCheck="checkparam.sh"

START_TIME=$(date +%s)

if [ -s "$fileFunc" ] && [ -s "$fileCheck" ]
then

        chmod +x "$fileFunc" "$fileCheck"
        . ./"$fileCheck"
        if [ "$errFlag" == 0 ]
        then

        . ./"$fileFunc"

        fi
else
echo "Error file is not exist"

fi
