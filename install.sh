#!/bin/bash
yum -y install epel-release
yum -y install $(cat packages)
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce
systemctl start docker
systemctl enable docker
yum -y install docker-compose
pip uninstall docker-py docker-compose -y
pip install docker-compose==1.9
cd ~/awx-installation/awx/installer/ && ansible-playbook -i inventory install.yml -vv
