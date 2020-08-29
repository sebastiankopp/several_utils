FROM openjdk:11-jre-slim-buster
RUN apt-get update && apt-get install libh2-java
RUN mkdir -p /h2-databases
EXPOSE 9092 8082
ENTRYPOINT java -cp /usr/share/java/h2.jar org.h2.tools.Server -tcp -web \
	-webAllowOthers -tcpAllowOthers \
	-baseDir /h2-databases \
	-webPort 8082 \
	-tcpPort 9092
