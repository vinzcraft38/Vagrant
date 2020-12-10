#!/bin/bash
#
apt-get update
apt-get -y upgrade
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common ## Ajout https apt + certificat + curl + agent cle gpg +
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ## Ajout package +  ajout gpg signature
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" ## Ajout lien repo dans apt
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io ## Install docker communitie edition + docker ce cli + containerd
usermod -aG docker vagrant ## Ajout user vagrant in docker group
systemctl enable docker ## Ajout auto startup docker
mkdir -p /srv/gitlab/{data,logs,config} ## Ajout dossier serveur gitlab
## GitLab-CE Container (docker)
docker run --detach \
--hostname gitlab \
--publish 80:80 \
--name gitlab \
--restart always \
--volume /srv/gitlab/config:/etc/gitlab \
--volume /srv/gitlab/logs:/var/log/gitlab \
--volume /srv/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce
