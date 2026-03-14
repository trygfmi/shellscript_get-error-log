#!/bin/bash
# ./command_example2.sh
# "$(find . -type f -name "command_example2.sh")"


shopt -s expand_aliases
source ~/.bash_profile

START_TIME="$(date +%s.%N)"
file_absolute_path="$(readlink -f "$0")"
echo "$file_absolute_path"


set -u -o pipefail

LOGFILE="error_log/command_example2.log"

# 実行 & 両方（標準出力＋標準エラー）をログに記録
# シェルの2>&1はリダイレクトで、標準エラー出力の2を標準出力の出力先にリダイレクトさせるという意味
python test.py >> "$LOGFILE" 2>&1
python test.py 2>&1 > error_log/app.log

# エラー終了したら特別なログを残す
if [ $? -ne 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Pythonスクリプトが異常終了しました (exit code=$?)" >> "$LOGFILE"
    # 必要ならメール通知やSlack通知などもここに書く
    # mail -s "Pythonスクリプトエラー" admin@example.com < "$LOGFILE"
fi


END_TIME="$(date +%s.%N)"
ELAPSED_TIME="$(echo "$END_TIME - $START_TIME" | bc)"
echo "実行時間:""$ELAPSED_TIME""s"
