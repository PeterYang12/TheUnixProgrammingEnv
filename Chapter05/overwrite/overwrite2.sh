#!/usr/bin/env bash
# overwrite: copy standstard input to output after EOF
#version 2. BUG here too
# overwrite输入的程序出错，导致输出为空，overwrite2.sh会破坏文件
# Example:
#   $sed 's/UNIX/UNIX(TM)/g' precious |write precious

PATH=/bin:/usr/bin

case $# in
1)  ;;
*)  echo "Usage: $0 file" 1>&2; exit 2
esac

new=/tmp/overwrite1.$$
old=/tmp/overwrite2.$$

trap 'rm -f $new $old; exit 1' 1 2 15

cat > $new # collect the input
cp $1 $old  # save original file

trap '' 1 2 15 # we are committedl ignore signals
cp $new $1  #overwrite th input file

rm -f $new $old