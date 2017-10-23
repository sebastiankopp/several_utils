#!/bin/sh

for i in  jar jarsigner java javac javadoc jaotc javapackager javaws jcmd jconsole jcontrol jdb jdeprscan jdeps jhsdb jimage jinfo jjs jlink jmap jmc jmod jps jrunscript jshell jstack jstat jstatd jweblauncher keytool pack200 policytool schemagen unpack200 wsgen wsimport xjc
do
	if [ -f $JAVA_HOME/bin/$i ]
	then
		update-alternatives --install /usr/bin/$i $i $JAVA_HOME/bin/$i 1
		update-alternatives --set $i $JAVA_HOME/bin/$i
	else
		>&2 echo "The file $JAVA_HOME/bin/$i does not exist!"
	fi
done

