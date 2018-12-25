#!/bin/sh

echo "JAVA_HOME is currently set to $JAVA_HOME"

SAVE_DIR=topkg/com/sun/tools/xjc/runtime/

mkdir -p ${SAVE_DIR}
CURR_WORKDIR=`pwd`
cd ${SAVE_DIR}
curl -sOL https://github.com/eclipse-ee4j/jaxb-ri/blob/master/jaxb-ri/xjc/src/main/java/com/sun/tools/xjc/runtime/ZeroOneBooleanAdapter.java 

cd ${CURR_WORKDIR}

${JAVA_HOME}/bin/jar --create --file zba.jar -C topkg/ . || exit $?

mvn install:install-file -Dfile=zba.jar -DgroupId=de.sebastiankopp.helpers \
		-DartifactId=zba-jaxb-res -Dversion=1.0 -Dpackaging=jar -DgeneratePom=true
