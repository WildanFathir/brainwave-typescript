pipeline {
    agent {
        docker {
            image 'node:18'
            // opsional kalau masih error, bisa tambahin ini:
            // args '-u root'
        }
    }

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
                // 🔹 1. paksa cache npm disimpan di workspace Jenkins (biar nggak kena error permission /.npm)
                sh 'npm config set cache $(pwd)/.npm-cache --global'

                // 🔹 2. install & build
                sh 'npm ci'
                sh 'npm run build'
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
