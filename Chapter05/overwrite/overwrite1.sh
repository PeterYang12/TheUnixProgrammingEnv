#!/usr/bin/env bash
# overwrite: copy standstard input to output after EOF
#version 1. BUG here
#用户在cp过程中按下DEL键，原来的输入文件将被破坏，必须防止对输入文件的覆盖被任何中断终止

PATH=/bin:/usr/bin

case $# in
1)  ;;
*)  echo "Usage: $0 file" 1>&2; exit 2
esac

new=/tmp/overwrite1.$$
old=/tmp/overwrite2.$$

trap 'rm -f $new $old; exit 1' 1 2 15

cat > $new # collect the input
cp $new $1  # overwrite the input file
rm -f $new
