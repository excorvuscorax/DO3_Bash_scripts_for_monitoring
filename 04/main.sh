#!/bin/bash

fileFunc="function.sh"
#fileFunc="falsfile.sh"

fileColor="color.sh"
fileConf="colors.cfg"




if [ -s "$fileFunc" ] && [ -s "$fileColor" ] && [ -s "$fileConf" ]
then
        chmod +x "$fileFunc" "$fileColor"

        . ./"$fileConf"

#Default color - black
if [ -z "$column1_background" ]; then
        column1_background=6
        color_back1_default=1
fi

#Default color - white
if [ -z "$column1_font_color" ]; then
        column1_font_color=1
        color_font1_default=1
fi


#Default color - red
if [ -z "$column2_background" ]; then
        column2_background=2
        color_back2_default=1
fi

#Default color - blue
if [ -z "$column2_font_color" ]; then
        column2_font_color=4
        color_font2_default=1
fi



                if [ "$column1_background" == "$column1_font_color" ] || [ "$column2_background" == "$column2_font_color" ]
                then
                echo "Error color. The background color and the text color should be different. Run a script again"
                exit 1
                fi

        . ./"$fileColor"
        color_setting "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"

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

        PRINT_ALL_COLORS

else
                echo "Error file is not exist"

fi
