FROM alpine:3.15.0
RUN apk add openjdk11-jre-headless && wget \
RUN mkdir /opt/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz
RUN tar zxvf apache-tomcat-*.tar.gz -C /opt/tomcat --strip-components 1
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
