FROM alpine:3.4
MAINTAINER Andres Cuadros "andrescuadros@gmail.com"

#ENV JAVA_VERSION=8u101 BUILD_VERSION=b13 JAVA_HOME=/usr/java/latest

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 102
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE       server-jre

## Installing java:
# - Install wget
# - Download java rpm
# - Install java rpm
# - Set java commands with alternatives
# - Remove java rpm

RUN apk add --update curl &&\
	mkdir -p /opt &&\
	curl -jkLH "Cookie: oraclelicense=accept-securebackup-cookie" -o java.tar.gz http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz &&\
	gunzip -c java.tar.gz | tar -xf - -C /opt && rm -f java.tar.gz &&\
	ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk &&\
	rm -rf /opt/jdk/*src.zip \
		/opt/jdk/lib/missioncontrol \
		/opt/jdk/lib/visualvm \
		/opt/jdk/lib/*javafx* \
		/opt/jdk/jre/lib/plugin.jar \
		/opt/jdk/jre/lib/ext/jfxrt.jar \
		/opt/jdk/jre/bin/javaws \
		/opt/jdk/jre/lib/javaws.jar \
		/opt/jdk/jre/lib/desktop \
		/opt/jdk/jre/plugin \
		/opt/jdk/jre/lib/deploy* \
		/opt/jdk/jre/lib/*javafx* \
		/opt/jdk/jre/lib/*jfx* \
		/opt/jdk/jre/lib/amd64/libdecora_sse.so \
		/opt/jdk/jre/lib/amd64/libprism_*.so \
		/opt/jdk/jre/lib/amd64/libfxplugins.so \
		/opt/jdk/jre/lib/amd64/libglass.so \
		/opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
		/opt/jdk/jre/lib/amd64/libjavafx*.so \
		/opt/jdk/jre/lib/amd64/libjfx*.so &&\
	apk del curl &&\
	rm -rf /var/cache/apk/*


ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

