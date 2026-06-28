#!/bin/bash
# Скрипт проверки ввода параметров на корректность
# Должны проверяться передаваемые параметры.
# Если параметров меньше или больше четырех,или не являются числовыми, то выводится ошибка.

echo "script checkparam.sh is runing..."

errFlag=0

if  [ $# != 4 ]
then
        echo  "Error count input parametr"
        errFlag=1
else
        while [ -n "$1" ]
        do
        if [[ $1 < 1 || $1 > 6 ]]
        then
        echo "Error value input parameter"
        errFlag=1
        exit  1
        fi

        shift
        done
fi
