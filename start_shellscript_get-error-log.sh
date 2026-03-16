#!/bin/bash
# ./start_shellscript_get-error-log.sh
# "$(find . -type f -name "start_shellscript_get-error-log.sh")"


echo "hello shellscript" >> log/command.log 2>> error_log/command_error.log
ls --false >> log/command.log 2>> error_log/command_error.log
