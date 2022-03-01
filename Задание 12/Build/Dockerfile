FROM openjdk:8u242-stretch
RUN apt update && apt install -y \
git \
maven \
&& rm -rf /var/lib/apt/lists/* \
WORKDIR /home/git
RUN git clone https://github.com/afanaskin/java_db-repo.git /home/git
RUN cd /home/git && mvn package
WORKDIR /home/war
RUN mv /home/git/target/*.war /home/war