pipeline {
  agent {
    docker {
      image '10.129.0.18:5000/builder:1.4'
      args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
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
        sh 'docker build -t app:1.0 .'
        sh '''docker tag app:1.0 10.129.0.18:5000/app:1.0 && docker push app:1.0 10.129.0.18:5000/app:1.0'''
      }
    }

  }
}
