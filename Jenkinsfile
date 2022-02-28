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
        sh 'cp /var/lib/jenkins/workspace/pipe_1/target/*.war /var/lib/jenkins/workspace/pipe_1/app && cd /var/lib/jenkins/workspace/pipe_1/app && docker build -t webapp:1.1 .'
        sh '''docker tag webapp:1.1 10.129.0.18:5000/webapp:1.1 && docker push 10.129.0.18:5000/webapp:1.1'''
      }
    }

    stage ('Run App') {
      steps {
        sh '''ssh root@10.129.0.30 docker pull 10.129.0.18:5000/webapp:1.1
	cd /home/afanaskin/run
	docker-compose up -d'''
      }
    }

  }
}
