#"!/bin/bash
# ./command_example.sh


shopt -s expand_aliases
source ~/.bash_profile

file_absolute_path="$(readlink -f "$0")"
# echo "$file_absolute_path"

# python ./test.py >> error_log/output.log 2>> error_log/error_output.log
# python ./test.py >> log_and_error_log.txt 2>&1

