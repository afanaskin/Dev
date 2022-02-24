FROM openjdk:8u242-stretch

#Install packages
RUN apt-get update && apt-get install -y git

#Install maven
RUN mkdir /opt/maven && \
    wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
    tar xf /opt/maven/apache-maven-*.tar.gz -C /opt/maven && \
    rm apache-maven-*.tar.gz
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}

#Install docker 20.10
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce=20.10.2~ce-0~debian

# Clear cache
RUN apt-get clean