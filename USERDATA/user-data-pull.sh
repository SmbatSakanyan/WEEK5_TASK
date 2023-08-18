#!/bin/bash

sudo -i

#installing docker ,aws_CLI 
snap install docker
docker --version
apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#AUthentication to ecr
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 490485542279.dkr.ecr.us-west-2.amazonaws.com


## waiting till image will be pushed

sleep 180

docker pull 490485542279.dkr.ecr.us-west-2.amazonaws.com/week4_ecr:latest
docker run -p 3000:3000 490485542279.dkr.ecr.us-west-2.amazonaws.com/week4_ecr