#!/usr/bin/env bash
# news: print news files, version 1
HOME=.
cd .
for i in `ls -t * $HOME/.news_time`
do
    case $i in 
    */.news_time) break;;
    *)  echo news: $i
    esac
done
touch $HOME/.news_time  #修改文件时间，不改变文件本身