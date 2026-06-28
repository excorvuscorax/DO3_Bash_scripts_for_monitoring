#!/bin/bash
# Скрипт проверки ввода параметра на корректность.

echo "script checkparam.sh is runing..."

errFlag=0

if  [ $# == 1 ] && [ -n $1 ]
then
        if [ -d $1 ]
        then
                if [ ${1: -1} = "/" ]
                then
                echo "parametr is OK"

                else
                echo "Directory must be with '/'. Run script again"
                exit 1
                fi
        else
        echo "This directory does not exist. Run script again"
        exit 1
        fi
else
        echo  "Error count input parametr"
        errFlag=1
fi
