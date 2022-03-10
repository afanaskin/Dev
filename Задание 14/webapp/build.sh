#! /bin/bash
apt update
apt install -y default-jdk
apt install -y git
apt install -y maven
mkdir /home/git
git clone https://github.com/deepshankaryadav/CyberFRAT-DevSecOps-Training-Sample-Java-App.git /home/git
cd /home/git && mvn package