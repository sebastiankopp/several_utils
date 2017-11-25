#!/bin/sh

for i in `ls $JAVA_HOME/bin | tr '\n' ' '`
do
	if [ -x $JAVA_HOME/bin/$i ]
	then
		update-alternatives --install /usr/bin/$i $i $JAVA_HOME/bin/$i 1
		update-alternatives --set $i $JAVA_HOME/bin/$i
	#	sudo update-alternatives --install /usr/bin/$i $i $JAVA_HOME/bin/$i 1
	#	sudo update-alternatives --set $i $JAVA_HOME/bin/$i
	else
		>&2 echo "The file $JAVA_HOME/bin/$i does not exist or is not executable!"
	fi
done

