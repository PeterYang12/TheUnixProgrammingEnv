#!/usr/bin/env bash
# watchwho: watch who logs in and out

PATH=/bin:/usr/bin
new=/tmp/wwho1.$$ #$$shell pid
old=/tmp/wwho2.$$   
>$old             # create an empty file

while : # ：仅仅计算参数值,然后返回真，和true一样，效率更高
do
    who > $new
    diff $old $new
    mv   $new $old
    sleep 5
done
# done | awk '/>/ {$1="in:  ";print}
#             /</ {$1="out:  ";print}'