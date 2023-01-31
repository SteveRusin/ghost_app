#! /bin/bash

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACC_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker pull ghost:4.12
docker push $AWS_ACC_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ghost:4.12
