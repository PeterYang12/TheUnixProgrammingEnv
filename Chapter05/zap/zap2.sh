#!/usr/bin/env bash
# zap pattern: kill all processes matching pattern
# final version

PATH=/bin:usr/bin

# IFS(内部字段分隔符)是一个字符串，通常包括空格、Tab和换行
# 设置成换行
IFS='
'

case $1 in
0)    echo "Usage: $0 pattern" 1>&2; exit 1 ;
esac

echo "    PID TTY      STAT   TIME COMMAND "
select var in $(ps -ag|grep "$1");do
    break
done
echo "You have selected $var"
echo "PID is :" $(echo $var| awk '{print $1}')