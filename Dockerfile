# busybox + java 8u20
# 
# VERSION 0.0.1

# 0.0.1 : initial file with busybox:ubuntu, image size=201.7MB
# 0.0.2 : change to server-jre (download less)
# 0.0.3 : debian jessie for UTF-8

FROM debian:jessie

MAINTAINER Samuel Nasello <samuel.nasello@elosi.com>

RUN apt-get update \
	&& apt-get install -y curl

# Install JAVA
RUN curl -kLOH "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/server-jre-8u25-linux-x64.tar.gz \
	&& gunzip server-jre-8u25-linux-x64.tar.gz \
	&& tar -xf server-jre-8u25-linux-x64.tar -C / \
	&& rm server-jre-8u25-linux-x64.tar \
	&& mv /jdk1.8.0_25/jre /jre1.8.0_25 \
	&& mv /jdk1.8.0_25/lib/tools.jar /jre1.8.0_25/lib/ext \
	&& rm -Rf /jdk1.8.0_25 \
	&& ln -s /jre1.8.0_25 /java

# Set UTF-8
ENV LC_ALL C.UTF-8
# Set JAVA_HOME
ENV JAVA_HOME /java
# Add to Path
ENV PATH $PATH:$JAVA_HOME/bin
# Default command
CMD ["java"]
