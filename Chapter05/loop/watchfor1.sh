#!/usr/bin/env bash
# watch for someone to log in
# 如果mary已经登录，需要等60秒才能知道其登录信息
while sleep 69
do
    who |grep mary
done
