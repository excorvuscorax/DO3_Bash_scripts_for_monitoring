#!/bin/bash
# Скрипт для инициализации цветов, используемых в дальнейших заливках.

echo "script color.sh is running"


clear_color="\033[0m"

# Цвета фона
bg_colors=("" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")

# Цвета текста
fg_colors=("" "\033[37m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m")



function color_setting {
color_array=()

color_array+=("${bg_colors[$1]}")
color_array+=("${fg_colors[$2]}")
color_array+=("${bg_colors[$3]}")
color_array+=("${fg_colors[$4]}")

}
