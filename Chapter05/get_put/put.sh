#!/usr/bin/env bash
# put: install file into history
PATH=/bin:/usr/bin

case $# in
1) HIST=$1.H ;;
*) echo "Usage: $0 file " 1>&2;exit 1
esac

if test ! -r $1
then
    echo "$0: can't open $1" 1>&2
fi

trap 'rm -f /tmp/put.[ab]$$; exit 1' 1 2 15
echo -n 'Summary: ' #不换行输出
read Summary

if ./get.sh -o /tmp/put.a$$ $1  # previous version
then    # merge pieces
    cp $1 /tmp/put.b$$      # current version
    echo "@@@ $USER `date` $Summary" >> /tmp/put.b$$
    diff -e $1 /tmp/put.a$$ >> /tmp/put.b$$ # latest diffs
    sed -n '/^@@@/, $p' <$HIST >> /tmp/put.b$$  # old diffs
    ./overwrite3.sh $HIST cat /tmp/put.b$$   # put it back
else
    echo "put: creating $HIST"
    cp $1 $HIST
    echo "@@@ $USER `date` $Summary" >> $HIST
fi

rm -f /tmp/put.[ab]$$