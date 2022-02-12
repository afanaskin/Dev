FROM ubuntu:18.04
RUN apt update && apt install -y \
default-jdk \
git \
maven \
&& rm -rf /var/lib/apt/lists/* \
WORKDIR /home/git
RUN git clone https://github.com/deepshankaryadav/CyberFRAT-DevSecOps-Training-Sample-Java-App.git /home/git
RUN cd /home/git && mvn package
WORKDIR /home/war
RUN mv /home/git/target/*.war /home/war