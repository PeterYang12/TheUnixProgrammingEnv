#!/usr/bin/env bash
# overwrite: copy standstard input to output after EOF
# final version

opath=$PATH
PATH=/bin:/usr/bin

case $# in
0|1)  echo "Usage: $0 file cmd [args]" 1>&2; exit 2
esac

file=$1; shift

new=/tmp/overwrite1.$$
old=/tmp/overwrite2.$$
trap 'rm -f $new $old; exit 1' 1 2 15 # clean up files

if PATH=$opath "$@" > $new # collect input
then
    cp $file $old   # save original file
    trap '' 1 2 15  # we are commited; ignore signals
    cp $new $file
else
    echo "$0 : $1 tailed, $file unchanged" 1>&2
    exit 1
fi
rm -f $new $old