#!/bin/bash

echo "script $0 is running...\n"

function HOSTNAME {
    host_str=`hostname`
    echo HOSTNAME = $host_str
}

function TIMEZONE {
    timezone_str=`timedatectl | awk '/Time zone:/{print $3, $4, $5}'`
    echo TIMEZONE = $timezone_str
}

function USER {
    user_str=`whoami`
    echo USER = $user_str
}

function OS {
    os_str=`lsb_release -d | awk '/Description/{print $2, $3, $4}'`
    echo OS = $os_str
}

function DATE {
    date_str=`date +"%d %B %Y %H:%M:%S"`
    echo DATE = $date_str
}

function UPTIME {
    uptime_str=`uptime | grep -oP 'up\s*\K[^,]*'`
    echo UPTIME = $uptime_str
}

function UPTIME_SEC {
    uptime_sec_str=`cat /proc/uptime | awk '{print $1}'`
    echo UPTIME_SEC = $uptime_sec_str  sec.
}

function IP {
    ip_str=`ip a | grep -oP 'inet \s*\K[^/]*' | tail -n 1`
    echo IP = $ip_str
}

# Нужен net-tools установленный (для ifconfig)
function MASK {
    mask_str=`ifconfig | grep 'netmask' -m 1 | awk '{print $4}'`
    echo MASK = $mask_str
}

function GATEWAY {
    gateway_str=`ip r | grep -oP 'default via \s*\K[^dev]*'`
    echo GATEWAY = $gateway_str
}

function RAM_TOTAL {
    ram_total_str=`free -m | awk 'NR==2{printf "%.3lf", $2 / 1000 }'`
    echo RAM_TOTAL = $ram_total_str  GB
}

function RAM_USED {
    ram_used_str=`free -m | awk 'NR==2{printf "%.3lf", $3 / 1000 }'`
    echo RAM_USED = $ram_used_str  GB
}

function RAM_FREE {
    ram_free_str=`free -m | awk 'NR==2{printf "%.3lf", $4 / 1000 }'`
    echo RAM_FREE = $ram_free_str  GB
}

function SPACE_ROOT {
    space_root_str=`df -k / | awk 'NR==2{printf "%.2f", $2 / 1000}'`
    echo SPACE_ROOT = $space_root_str  MB
}

function SPACE_ROOT_USED {
    space_root_used_str=`df -k / | awk 'NR==2{printf "%.2f", $3 / 1000}'`
    echo SPACE_ROOT_USED = $space_root_used_str  MB
}

function SPACE_ROOT_FREE {
    space_root_free_str=`df -k / | awk 'NR==2{printf "%.2f", $4 / 1000}'`
    echo SPACE_ROOT_FREE = $space_root_free_str  MB
}
