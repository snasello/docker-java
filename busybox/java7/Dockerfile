# busybox + java 7u71
# 
# VERSION 0.0.5

# 0.0.1 : initial file with centos 6.4 and java 7u60
# 0.0.2 : change centos from 6.4 to 6 and java 7u60 to 7u71
# 0.0.3 : take only necessary in jdk (jre+tools.jar) : reduce image size from 580.4MB to 449.6MB, add JAVA_HOME env
# 0.0.4 : change to debian:wheezy in order to reduce image size (449.6MB->269.4MB)
# 0.0.5 : change to busybox:ubuntu in order to reduce image size (177.2MB)

FROM busybox:ubuntu-14.04

MAINTAINER Samuel Nasello <samuel.nasello@elosi.com>

# Install curl with ssl support
#
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
    && mv /curl-7.30.0.ermine/curl.ermine /bin/curl \
    && rm -Rf /curl-7.30.0.ermine

# Install JAVA
RUN (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz | tar xfz - -C /) \
	&& mv /jdk1.7.0_71/jre /jre1.7.0_71 \
	&& mv /jdk1.7.0_71/lib/tools.jar /jre1.7.0_71/lib/ext \
	&& rm -Rf /jdk1.7.0_71 \
	&& ln -s /jre1.7.0_71 /java

# Set JAVA_HOME
ENV JAVA_HOME /java
# Add to Path
ENV PATH $PATH:$JAVA_HOME/bin
# Default command
CMD ["java"]
