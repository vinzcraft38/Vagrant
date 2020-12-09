#!/bin/bash
#
apt-get update
apt-get -y upgrade
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common ## ajout htttps apt + certificat + curl + agent cle gpg +
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ## ajout package +  ajout gpg signature
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" ## ajout lien repo dans apt
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io ## install docker comuniti edition + docker ce cli + containerd
usermod -aG docker vagrant ##ajout user vagrant in docker group
systemctl enable docker ##auto startup docker