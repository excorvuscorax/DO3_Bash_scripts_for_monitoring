#!/bin/bash
# Скрипт для инициализации цветов, используемых в дальнейших заливках.

echo "script color.sh is running"


clear_color="\033[0m"

# Цвета фона
bg_colors=("" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")

# Цвета текста
fg_colors=("" "\033[37m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m")


function color_setting {
numb_array=()
numb_array+=("$1")
numb_array+=("$2")
numb_array+=("$3")
numb_array+=("$4")

color_array=()
color_array+=("${bg_colors[$1]}")
color_array+=("${fg_colors[$2]}")
color_array+=("${bg_colors[$3]}")
color_array+=("${fg_colors[$4]}")
}


function print_color {
    if [ "$1" = "${bg_colors[1]}" ] || [ "$1" = "${fg_colors[1]}" ]; then
        echo "white"
    elif [ "$1" = "${bg_colors[2]}" ] || [ "$1" = "${fg_colors[2]}" ]; then
        echo "red"
    elif [ "$1" = "${bg_colors[3]}" ] || [ "$1" = "${fg_colors[3]}" ]; then
        echo "green"
    elif [ "$1" = "${bg_colors[4]}" ] || [ "$1" = "${fg_colors[4]}" ]; then
        echo "blue"
    elif [ "$1" = "${bg_colors[5]}" ] || [ "$1" = "${fg_colors[5]}" ]; then
        echo "purple"
    elif [ "$1" = "${bg_colors[6]}" ] || [ "$1" = "${fg_colors[6]}" ]; then
        echo "black"
    fi
}

function PRINT_ALL_COLORS {
    echo -en "\nColumn 1 background = "
    if [ -z "$color_back1_default" ]; then
        echo "${numb_array[0]} ($(print_color $column1_background))"
    else
        echo "default ($(print_color $column1_background))"
    fi

    echo -n "Column 1 font color = "
    if [ -z "$color_font1_default" ]; then
        echo "${numb_array[1]} ($(print_color $column1_font_color))"
    else
        echo "default ($(print_color $column1_font_color))"
    fi

    echo -n "Column 2 background = "
    if [ -z "$color_back2_default" ]; then
        echo "${numb_array[2]} ($(print_color $column2_background))"
    else
        echo "default ($(print_color $column2_background))"
    fi

    echo -n "Column 2 font color = "
    if [ -z "$color_font2_default" ]; then
        echo "${numb_array[3]} ($(print_color $column2_font_color))"
    else
        echo "default ($(print_color $column2_font_color))"
    fi
}
