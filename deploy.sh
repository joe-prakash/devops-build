#!/bin/bash

# Step 1: Pull the Docker image from DockerHub
echo "Pulling the Docker image from DockerHub..."
docker pull joeprakkash/$1

# Step 2: Run the Docker container on port 80
echo "Running the Docker container..."
docker run -d -p 80:80 --name react-app joeprakkash/$1

echo "Deployment completed. You can now access the app at http://<your-ec2-public-ip>"

