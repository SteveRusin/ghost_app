#! /bin/bash

source ./source-env.sh

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACC_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker pull ghost:4.12
IMAGE_ID=$(docker images | grep -m 1 ghost | awk '{print $3}');

docker tag $IMAGE_ID $AWS_ACC_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ghost:4.12
docker push $AWS_ACC_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ghost:4.12
