pipeline {
    agent any

    environment {
        DOCKER_CRED = credentials('ci-cd-test') // ID credential di Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install dependencies & Build') {
            steps {
                sh 'npm ci'
                sh 'npm run build'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t wildanfathir/brainwave-typescript:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                sh "echo $DOCKER_CRED_PSW | docker login -u $DOCKER_CRED_USR --password-stdin"
                sh 'docker push wildanfathir/brainwave-typescript:latest'
            }
        }
    }
}
