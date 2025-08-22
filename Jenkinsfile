pipeline {
    agent any

    environment {
        DOCKER_HUB = "wildanfathir/brainwave-typescript"
        DOCKER_CREDENTIALS_ID = "ci-cd-test"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install dependencies & Build') {
            steps {
                script {
                    docker.image('node:18').inside('-u root') {
                        sh 'npm ci'
                        sh 'npm run build'
                    }
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        def app = docker.build("${DOCKER_HUB}:${env.BRANCH_NAME}-${env.BUILD_NUMBER}")
                        app.push()
                        app.push("latest")
                    }
                }
            }
        }
    }
}
