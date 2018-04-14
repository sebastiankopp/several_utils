#!/bin/bash

for i in `ls | tr '\n' ' '`
do
	if [ -d $i ]
	then 
		DATE_N_SUFFIX=`date +%Y-%m-%d--%H-%M-%S`
		ZIPNAME="$i--${DATE_N_SUFFIX}.zip"
		zip -r  $ZIPNAME $i
	fi
done
