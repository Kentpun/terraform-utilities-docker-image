FROM debian:stable as base

RUN \
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y && \
# nano
apt-get install nano -y && \
# curl
apt-get install curl -y && \
# gnupg
apt-get install gnupg -y && \
# add-apt-repository
apt-get install software-properties-common -y

# =================
# Install terraform
# =================

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

RUN apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt-get update && apt-get install terraform

RUN terraform --version

# =================
# Install Python
# =================
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip

RUN python3 -V
RUN pip --version

# =================
# Install AWS cli
# =================
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install -i /usr/local/aws-cli -b /usr/local/bin

RUN aws --version

# Create aws credential file
RUN mkdir ~/.aws && touch ~/.aws/credentials

# =================
# Install Kubectl
# =================
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Checksum
RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN kubectl version --client
