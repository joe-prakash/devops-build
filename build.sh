#!/bin/bash


# Step 1: Set the image tag based on the branch
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH_NAME" == "dev" ]; then
    IMAGE_TAG="joeprakkash/dev"
elif [ "$BRANCH_NAME" == "main" ]; then
    IMAGE_TAG="joeprakkash/prod"
else
    echo "Unsupported branch: $BRANCH_NAME"
    exit 1
fi

# Step 2: Export IMAGE_TAG as an environment variable for Docker Compose
export IMAGE_TAG

# Step 3: Build Docker Image using Docker Compose
echo "Building the Docker image..."
docker-compose build

# Step 4: Push the Docker image to DockerHub
echo "Pushing the Docker image to DockerHub as $IMAGE_TAG..."
docker-compose push

echo "Build and push process completed successfully."

