pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning source code...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                bat 'docker build -t driver-drowsiness-app .'
            }
        }

        stage('Run Application') {
            steps {
                echo 'Running Docker Container...'
                bat 'docker run -d -p 5000:5000 --name drowsy driver-drowsiness-app'
            }
        }
    }

    post {
        success {
            echo '✅ Build Successful! Visit http://localhost:5000'
        }
        failure {
            echo '❌ Build Failed'
        }
    }
}
