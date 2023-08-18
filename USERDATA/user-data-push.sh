#!/bin/bash
sudo -i


snap install docker
apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install


cd /home/ubuntu
git clone  https://github.com/brainscalesolutions/brainscale-simple-app.git
cd brainscale-simple-app
cat <<EOF > Dockerfile
FROM node:18
# Create app directory
WORKDIR /usr/src/app
RUN npm install ejs express

# Bundle app source
COPY . .
EXPOSE 3000
CMD [ "node", "app.js" ]
EOF

docker build -t week5_ecr .

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 490485542279.dkr.ecr.us-west-2.amazonaws.com
docker tag week5_ecr:latest 490485542279.dkr.ecr.us-west-2.amazonaws.com/week5_ecr:latest
docker push 490485542279.dkr.ecr.us-west-2.amazonaws.com/week5_ecr:latest
