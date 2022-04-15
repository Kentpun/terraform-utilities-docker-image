#!/bin/sh
ACCOUNT_NAME="kentpun"
IMAGE_NAME="tf-kubectl-aws"
TAG="latest"

docker build --progress=plain --no-cache -t $ACCOUNT_NAME/$IMAGE_NAME:$TAG .

docker push $ACCOUNT_NAME/$IMAGE_NAME:$TAG
