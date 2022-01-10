#!/usr/bin/env bash

trap "" 1 2 15
# test -t 测试标准输出是否是terminal
if test -t 2>&1
then
    # 以更改过的优先序来执行程序,内定的 adjustment 为 10，范围为 -20（最高优先序）到 19（最低优先序）。
    echo "Sending output to 'nohup.out'"
    # exec 内置命令，用给定程序代替运行shell的进程，节省一个shell进程
    exec nice -n -5 $* >> nohup.out 2>&1
else
    exec nice -n -5 $* 2>&1
fi