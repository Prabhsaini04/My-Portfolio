#!/bin/bash
REGION="ap-southeast-1"
REGISTRY_URI="516224964121.dkr.ecr.ap-southeast-1.amazonaws.com"
REPOSITORY_URI="516224964121.dkr.ecr.ap-southeast-1.amazonaws.com/my-docker-repo"

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $REGISTRY_URI
docker pull $REPOSITORY_URI:latest

docker stop my-app || true
docker rm my-app || true

docker run -d --name my-app -p 80:8080 $REPOSITORY_URI:latest
