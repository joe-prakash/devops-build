pipeline {
    agent any

    environment {
        DOCKER_CLI_EXPERIMENTAL = 'enabled'
        DOCKER_IMAGE = 'react-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository from GitHub
                git branch: 'main', url: 'https://github.com/joe-prakash/devops-build.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Run the build script to create the Docker image
                    sh './build.sh'
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Docker image will be pushed during the build.sh execution
                    echo 'Image has been pushed during the build step.'
                }
            }
        }
    }
    
    post {
        success {
            echo "Docker image has been successfully pushed!"
        }
        failure {
            echo "Build failed!"
        }
    }
}

