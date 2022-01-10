#!/usr/bin/env bash
# which.sh cmd: which cmd in PATH is executed

opath=$PATH
PATH=/bin:usr/bin

case $# in 
	0) echo "Usage: $0 command" 1>&2; exit 2
esac

for i in `echo $opath|sed 's/^:/.:/
			  s/::/:.:/g
			  s/:$/:./
			  s/:/ /g'`
do
	if test -f $i/$1
	then
		echo $i/$1
		exit 0	# found it
	fi
done
echo "File $1 is not found in PATH"
exit 1	 # not found
