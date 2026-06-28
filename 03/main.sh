#!/bin/bash

fileFunc="function.sh"
#fileFunc="falsfile.sh"

fileCheck="checkparam.sh"
fileColor="color.sh"

if [ -s "$fileFunc" ] && [ -s "$fileCheck" ] && [ -s "$fileColor" ]
then
        chmod +x "$fileFunc" "$fileCheck" "$fileColor"

        . ./"$fileCheck" "$@"

        if [ "$errFlag" == 0 ]
        then
                if [ "$1" == "$2" ] || [ "$3" == "$4" ]
                then
                echo "Error color. The background color and the text color should be different. Run a script again"
                exit 1
                fi

        . ./"$fileColor"
        color_setting "$1" "$2" "$3" "$4"

        column1_background="${color_array[0]}"
        column1_font_color="${color_array[1]}"
        column2_background="${color_array[2]}"
        column2_font_color="${color_array[3]}"

        . ./"$fileFunc"

        HOSTNAME
        TIMEZONE
        USER
        OS
        DATE
        UPTIME
        UPTIME_SEC
        IP
        MASK
        GATEWAY
        RAM_TOTAL
        RAM_USED
        RAM_FREE
        SPACE_ROOT
        SPACE_ROOT_USED
        SPACE_ROOT_FREE
        fi

else
                echo "Error file is not exist"

fi
