pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t mmorpg-platform:latest .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run mmorpg-platform:latest pytest tests/'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
                sh './server_maintenance.sh'
            }
        }
        stage('Monitor') {
            steps {
                sh 'curl http://prometheus:9090/api/v1/query?query=up'
            }
        }
    }
}
