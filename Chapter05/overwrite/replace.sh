#!/usr/bin/env bash
# replace: replace file str1 in files with str2, inplace

PATH=bin:/usr/bin

case $# in
0|1|2) echo "Usage: $0 str1 str2 files" 1>&2; exit 1
esac

left="$1"; right="$2";shift;shift

for i
do
    ./overwrite3.sh $i sed "s@$left@$right@g" $i
done