#!/bin/bash

fileFunc="function.sh"
#fileFunc="errorfile.sh"

if [ -s $fileFunc ]
then
        chmod +x $fileFunc

        . ./$fileFunc
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

        echo "Do you want to write this data to a file? (Y - yes /N - no)"
        read inputKeyboard

        if [[ $inputKeyboard == Y || $inputKeyboard == y || $inputKeyboard == yes ]]
        then
        echo "Data has been recorded"
        dateNow=`date +"%d_%m_%Y_%H_%M_%S"`
        echo -e "HOSTNAME = $host_str\nTIMEZONE = $timezone_str\nUSER = $user_str\nOS = $os_str\nDATE = $date_str\nUPTIME = $uptime_str\nUPTIME_SEC = $uptime_sec_str sec.\nIP = $ip_str\nMASK = $mask_str\nGATEWAY = $gateway_str\nRAM_TOTAL = $ram_total_str GB\nRAM_USED = $ram_used_str GB\nRAM_FREE = $ram_free_str GB\nSPACE_ROOT = $space_root_str MB\nSPACE_ROOT_USED = $space_root_used_str MB\nSPACE_ROOT_FREE = $space_root_free_str MB" > "${dateNow}.status"
        fi

else
                echo "Error file is not exist"

fi
