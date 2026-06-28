#!/bin/bash

echo "script function.sh is running..."

function HOSTNAME {
    host_str=`hostname`
    echo -en "${column1_background}${column1_font_color}HOSTNAME${clear_color} = ${column2_background}${column2_font_color}$host_str${clear_color}\n"
}

function TIMEZONE {
    timezone_str=`timedatectl | awk '/Time zone:/{print $3, $4, $5}'`
    echo -en "${column1_background}${column1_font_color}TIMEZONE${clear_color} = ${column2_background}${column2_font_color}$timezone_str${clear_color}\n"
}

function USER {
    user_str=`whoami`
    echo -en "${column1_background}${column1_font_color}USER${clear_color} = ${column2_background}${column2_font_color}$user_str${clear_color}\n"
}

function OS {
    os_str=`lsb_release -d | awk '/Description/{print $2, $3, $4}'`
    echo -en "${column1_background}${column1_font_color}OS${clear_color} = ${column2_background}${column2_font_color}$os_str${clear_color}\n"
}

function DATE {
    date_str=`date +"%d %B %Y %H:%M:%S"`
    echo -en "${column1_background}${column1_font_color}DATE${clear_color} = ${column2_background}${column2_font_color}$date_str${clear_color}\n"
}

function UPTIME {
    uptime_str=`uptime | grep -oP 'up\s*\K[^,]*'`
    echo -en "${column1_background}${column1_font_color}UPTIME${clear_color} = ${column2_background}${column2_font_color}$uptime_str${clear_color}\n"
}

function UPTIME_SEC {
    uptime_sec_str=`cat /proc/uptime | awk '{print $1}'`
    echo -en "${column1_background}${column1_font_color}UPTIME_SEC${clear_color} = ${column2_background}${column2_font_color}$uptime_sec_str  sec.${clear_color}\n"
}

function IP {
    ip_str=`ip a | grep -oP 'inet \s*\K[^/]*' | tail -n 1`
    echo -en "${column1_background}${column1_font_color}IP${clear_color} = ${column2_background}${column2_font_color}$ip_str${clear_color}\n"
}

function MASK {
    mask_str=`ifconfig | grep 'netmask' -m 1 | awk '{print $4}'`
    echo -en "${column1_background}${column1_font_color}MASK${clear_color} = ${column2_background}${column2_font_color}$mask_str${clear_color}\n"
}

function GATEWAY {
    gateway_str=`ip r | grep -oP 'default via \s*\K[^dev]*'`
    echo -en "${column1_background}${column1_font_color}GATEWAY${clear_color} = ${column2_background}${column2_font_color}$gateway_str${clear_color}\n"
}

function RAM_TOTAL {
    ram_total_str=`free -m | awk 'NR==2{printf "%.3lf", $2 / 1000 }'`
    echo -en "${column1_background}${column1_font_color}RAM_TOTAL${clear_color} = ${column2_background}${column2_font_color}$ram_total_str  GB${clear_color}\n"
}

function RAM_USED {
    ram_used_str=`free -m | awk 'NR==2{printf "%.3lf", $3 / 1000 }'`
    echo -en "${column1_background}${column1_font_color}RAM_USED${clear_color} = ${column2_background}${column2_font_color}$ram_used_str  GB${clear_color}\n"
}

function RAM_FREE {
    ram_free_str=`free -m | awk 'NR==2{printf "%.3lf", $4 / 1000 }'`
    echo -en "${column1_background}${column1_font_color}RAM_FREE${clear_color} = ${column2_background}${column2_font_color}$ram_free_str  GB${clear_color}\n"
}

function SPACE_ROOT {
    space_root_str=`df -k / | awk 'NR==2{printf "%.2f", $2 / 1000}'`
    echo -en "${column1_background}${column1_font_color}SPACE_ROOT${clear_color} = ${column2_background}${column2_font_color}$space_root_str  MB${clear_color}\n"
}

function SPACE_ROOT_USED {
    space_root_used_str=`df -k / | awk 'NR==2{printf "%.2f", $3 / 1000}'`
    echo -en "${column1_background}${column1_font_color}SPACE_ROOT_USED${clear_color} = ${column2_background}${column2_font_color}$space_root_used_str  MB${clear_color}\n"
}

function SPACE_ROOT_FREE {
    space_root_free_str=`df -k / | awk 'NR==2{printf "%.2f", $4 / 1000}'`
    echo -en "${column1_background}${column1_font_color}SPACE_ROOT_FREE${clear_color} = ${column2_background}${column2_font_color}$space_root_free_str  MB${clear_color}\n"
}
