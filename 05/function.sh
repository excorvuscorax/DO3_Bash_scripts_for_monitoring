#!/bin/bash
echo "script function.sh is running"

total_number="$(ls -l $1 | grep -c ^d)"
echo "Total number of folders = $total_number"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$(du -Sh $1 | sort -hr | head -5 | nl | awk '{print $1, "-",  $3",",$2}' | column -t)"

total_files="$(ls -laR $1 | grep "^-" | wc | awk '{print $1}')"
echo "Total number of files  = $total_files"

conf_files="$(find $1 -type f -name "*.conf" | wc -l)"
echo "Configuration files (with the .conf extension) $conf_files"

text_files="$(find $1 -type f -name "*.txt" | wc -l)"
echo "Text files = $text_files"

exe_files="$(find $1 -type f -name -executable | wc -l)"
echo "Executable files = $exe_files"

log_files="$(find $1 -type f -name "*.log" | wc -l)"
echo "Log files (with the extension .log) = $log_files"

archive_files="$(find $1 -type f -name "*.7z" -or  -name "*.zip" -or  -name "*.rar"  -or  -name "*.gz" >
echo "Archive files = $archive_files"

symb_link_files="$(find $1 -type l | wc -l)"
echo "Symbolic links = $symb_link_files"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
maximum_size_10=$(find $1 -type f -printf '%p %s\n' | awk -F '.' '{print $0 " " $NF}' | sort -n -r -k2 >
echo "$maximum_size_10"

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash>

for i in {1..10}
do
top_executable_file=$(find $1 -executable -type f -exec du -h {} + | sort -rh | head | nl | sed "${i}q;>
    if ! [[ -z $top_executable_file ]]
    then
        npath=$(echo $top_executable_file | awk '{print $3}')
        MD5=$(md5sum $npath | awk '{print $1}')
        echo -n "$(echo $top_executable_file | awk '{print $1, $2, $3"," ,$4 }')"
        echo " $MD5"
  fi
done

END_TIME=$(date +%s)
difference=$(( $END_TIME - $START_TIME ))
echo "Script execution time (in seconds) = $difference sec."
