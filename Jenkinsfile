pipeline {
    agent any
    tools {
        jdk 'jdk17'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/mdjameel313/Zo-Kart.git'
            }
        }
        
        stage('Docker Build & Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub', toolName: 'docker') {
                        sh 'docker build -t zoo .'
                        sh 'docker tag zoo mdjameel313/zo-kart:latest'
                        sh 'docker push mdjameel313/zo-kart:latest'
                    }
                }
            }
        }
        
        stage('Deploy to Container') {
            steps {
                sh 'docker run -d --name redditzo-kart -p 80:90 mdjameel313/zo-kart:latest'
            }
        }
    }
}