pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/AzaryaSantoso/hello-world-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t hello-world-app .'
                }
            }
        }
        stage('Stop Remaining Container') {
            steps {
                script {
                    bat 'docker stop hello-world-app-test || exit 0'
                    bat 'docker rm hello-world-app-test || exit 0'
                    
                    bat 'docker stop hello-world-app-prod || exit 0'
                    bat 'docker rm hello-world-app-prod || exit 0'
                }
            }
        }
        stage('Run and Test Docker Container') {
            steps {
                script {
                    // Run container for testing
                    bat 'docker run -d --name hello-world-app-test -p 3000:3000 hello-world-app'
                    bat 'docker exec hello-world-app-test npm install'
                    bat 'docker exec hello-world-app-test npm test'
                    // Stop and remove test container
                    bat 'docker stop hello-world-app-test'
                    bat 'docker rm hello-world-app-test'
                }
            }
        }
        stage('Deploy Docker Container') {
            steps {
                script {
                    // Run the new container
                    bat 'docker run -d -p 3000:3000 --name hello-world-app-prod hello-world-app'
                }
            }
        }
    }
}