#!/bin/bash

if [ $# -gt 0 ] && [ "-h" = $1 ]
then
	echo "Usage: $0 [ SAVEDIR ... ]"
	exit 0;
fi

for i in `ls | tr '\n' ' '`
do
	if [ -d $i ]
	then 
		DATE_N_SUFFIX=`date +%Y-%m-%d--%H-%M-%S`
		ZIPNAME="$i--${DATE_N_SUFFIX}.zip"
		zip -r  $ZIPNAME $i
		for j in $*
		do
			if [ -d $j ]
			then
				cp -n $ZIPNAME $j
			fi
		done
	fi
done
