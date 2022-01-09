#!/usr/bin/env bash
#cal: nicer interface to /usr/bin/cal
set -e

case $# in
	0) set `date`; m=$3; y=$4 ;; #'date'=$(date)
	1) m=$1; y=$(date|awk '{print $4}');;
	*) m=$1; y=$2;;
esac

case $m in
	jan*|Jan*)	m=1 ;;
	feb*|Feb*)	m=2 ;;
	mar*|Mar*)	m=3 ;;
	apr*|Apr*)	m=4 ;;
	may*|May*)	m=5 ;;
	jun*|Jun*)	m=6 ;;
	jul*|Jul*)	m=7 ;;
	aug*|Aug*)	m=8 ;;
	sep*|Sep*)	m=9 ;;
	oct*|Oct*)	m=10;;
	nov*|Nov*)	m=11;;
	dec*|Dec*)	m=12;;
	[1-9] | 10 | 11 | 12 );;
	*)	y=$m; m="";;
esac

#echo month $m
#echo year $y

/usr/bin/cal $m $y
