pipeline {
  agent any

  environment {
    IMAGE_NAME = "rakesh278/product-service:latest"
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/Rakesh278/product-service.git'
      }
    }

    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
          sh 'docker push $IMAGE_NAME'
        }
      }
    }

    stage('Deploy to K8s') {
      steps {
        sshagent(['ec2-key']) {
          sh '''
          ssh -o StrictHostKeyChecking=no ubuntu@<EC2-IP> "
            kubectl set image deployment/product-service product-service=$IMAGE_NAME --record
          "
          '''
        }
      }
    }
  }
}
