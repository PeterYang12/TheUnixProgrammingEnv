#!/usr/bin/env bash
# get.sh : extract file from history

PATH=/bin:/usr/bin

VERSION=0
while test "$1" != ""
do
    case "$1" in
        -i) INPUT=$2; shift ;;
        -o) OUTPUT=$2; shift ;;
        -[0-9]) VERSION=$1 ;;
        -*)echo "get: Unknown argument $i" 1>&2 ;exit 1;;
        -*) case "$OUTPUT" in
            "") OUTPUT=$1 ;;
            *) INPUT=$1.H ;;
            esac
    esac
    shift
done
OUTPUT=$ {OUTPUT?"Usage: get[-o outfile] [-i file.H] file"}
INPUT=$ {INPUT-$OUTPUT.H}
test -r $INPUT || {echo "get.sh : no file $INPUT" 1>&2; exit 1;}
trap 'rm -f /tmp/get.[ab]$$; exit 1' 1 2 15
# split into current version and editing commands
sed < $INPUT -n < '1, /^@@@/w /tmp/get.a'$$'
                    /^@@@/,$w /tmp/get.b'$$
# perform the edits
awk </tmp/get.b$$ '
    /^@@@/  {count++ }
    !/^@@@/ && count>0 && count <= - $version
    END {print "$d"; print "w", "$output"}
'|ed -/tmp/get.a$$
rm -r /tmp/get.[ab]$$