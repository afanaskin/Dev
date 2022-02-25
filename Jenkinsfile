pipeline {
  agent {
    docker {
      image '10.129.0.18:5000/builder:1.0'
    }
  }

  stages {
    stage ('Copy source') {
      steps {
        git 'https://github.com/afanaskin/hello.git'
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