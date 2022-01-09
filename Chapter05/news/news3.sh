#!/usr/bin/env bash
# news: print news files

PATH=/bin:/usr/bin
IFS='
'

HOME=.
cd .

for i in `ls -t * $HOME/.news_time 2>&1`
do
    IFS=' '
    case $i in
    *'No such file'*) ;;
    */.news_time) break;;
    *)  set X `ls -l $i`
        echo "
        $i: ($3) $5 $6 $7
        "
            # cat $i
    esac
done

touch $HOME/.news_time  #修改文件时间，不改变文件本身