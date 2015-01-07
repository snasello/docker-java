# busybox + java 8u20
# 
# VERSION 0.0.1

# 0.0.1 : initial file with busybox:ubuntu, image size=201.7MB

FROM busybox:ubuntu-14.04

MAINTAINER Samuel Nasello <samuel.nasello@elosi.com>

# Install curl with ssl support
#
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
    && mv /curl-7.30.0.ermine/curl.ermine /bin/curl \
    && rm -Rf /curl-7.30.0.ermine

# Install JAVA
RUN (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz | tar xfz - -C /) \
	&& mv /jdk1.8.0_25/jre /jre1.8.0_25 \
	&& mv /jdk1.8.0_25/lib/tools.jar /jre1.8.0_25/lib/ext \
	&& rm -Rf /jdk1.8.0_25 \
	&& ln -s /jre1.8.0_25 /java

# UTF-8
ENV LANG C.UTF-8
# Set JAVA_HOME
ENV JAVA_HOME /java
# Add to Path
ENV PATH $PATH:$JAVA_HOME/bin
# Default command
CMD ["java"]
