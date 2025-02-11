pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials-id')  // Jenkins credentials for Docker Hub
    }

    stages {
        stage('Clone Repo') {
            steps {
                // Checkout the appropriate branch from GitHub
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/yourusername/yourrepo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Set the Docker image tag based on the branch name
                    def imageTag = "${env.BRANCH_NAME}"

                    // Build the Docker image using the Dockerfile
                    sh "docker build -t joeprakkash/${imageTag}:latest ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Determine the Docker Hub repository based on the branch name
                    def imageTag = "${env.BRANCH_NAME}"
                    def repo = "joeprakkash/${imageTag}"

                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin"
                    }

                    // Push the Docker image to the appropriate repository
                    sh "docker push ${repo}:latest"
                }
            }
        }

        stage('Deploy to Server') {
            when {
                expression {
                    return env.BRANCH_NAME == 'dev' || env.BRANCH_NAME == 'prod'
                }
            }
            steps {
                script {
                    // Deploy the image (can be using docker-compose or direct docker commands)
                    echo "Deploying ${env.BRANCH_NAME} version..."
                    sh './deploy.sh'
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built, pushed, and deployed successfully.'
        }
        failure {
            echo 'Build, push, or deployment failed.'
        }
    }
}

