pipeline {
  agent {
    docker {
      image '10.129.0.7:8123/builder:1.0'
    }
  }

  stages {
    stage ('Copy source') {
      steps {
        /*mkdir /home/git
        cd /home/git*/
        git 'https://github.com/deepshankaryadav/CyberFRAT-DevSecOps-Training-Sample-Java-App.git'
      }
    }

    stage ('Build war') {
      steps {
        sh 'mvn package'
      }
    }

    /*stage ('Make docker image') {
      steps {
        sh 'cp -R /home/afanaskin/build/*'
      }
    }*/

  }
}