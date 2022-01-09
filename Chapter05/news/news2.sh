#!/usr/bin/env bash
# news: print news files, version 2

HOME=.
cd .
IFS='
'

for i in `ls -t * $HOME/.news_time 2>&1`
do
    case $i in 
    *'No such file'*) ;;
    */.news_time) break;;
    *)  echo "news: $i" ;; 
    esac
done
touch $HOME/.news_time  #修改文件时间，不改变文件本身