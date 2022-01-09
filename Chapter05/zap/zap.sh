#!/usr/bin/env bash
# zap pattern: kill all processes matching pattern
# final version

PATH=/bin:usr/bin
# IFS(内部字段分隔符)是一个字符串，通常包括空格、Tab和换行
# 设置成换行
IFS='
'

case $1 in
"")    echo "Usage: $0 [-2] pattern" 1>&2; exit 1 ;;
-*)    SIG=$1; shift
esac

echo "    PID TTY      STAT   TIME COMMAND "
kill $SIG $( pick $(ps -ag|egrep "$*) | awk '{print $1}'))
