pipeline {
  agent {
    docker {
      image '10.129.0.18:5000/builder:1.5'
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

    stage ('Make docker image') {
      steps {
        sh 'sudo docker build -t app:1.0 .'
        sh '''sudo docker tag app:1.0 10.129.0.18:5000/app:1.0 && docker push app:1.0 10.129.0.18:5000/app:1.0'''
      }
    }

  }
}