#!/usr/bin/env bash
# watch for someone to log in

PATH=/bin:/usr/bin
case $# in
0)  echo "Usage, watch for person : $0 person" 1>&2; exit
esac

until who|egrep "$1"
do
    sleep 60
done