# pull jenkins image from docker hub
FROM jenkins/jenkins:lts

# Build the container
USER root

# install wget
RUN apt-get install -y wget

# get maven 
RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

# install maven

RUN tar -xvzf apache-maven-3.3.9-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.9-bin.tar.gz
ENV MAVEN_HOME /opt/maven


RUN chown -R jenkins:jenkins /opt/maven

# remove downloaded archives
RUN apt-get clean

USER jenkins

