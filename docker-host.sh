#!/bin/bash

# Update software list
echo '-------------------'
echo 'sudo apt-get update'
echo ''
echo ''
sudo apt-get update

# Generates, encrypts, and saves passwords
echo '--------------------------------'
echo 'sudo apt-get install -y keepassx'
sudo apt-get install -y keepassx

# Editor
echo '-----------------------------'
echo 'sudo apt-get install -y geany'
sudo apt-get install -y geany

# File search
echo '------------------------------------'
echo 'sudo apt-get install -y searchmonkey'
sudo apt-get install -y searchmonkey

# View SQLite database
echo '-------------------------------------'
echo 'sudo apt-get install -y sqlitebrowser'
sudo apt-get install -y sqlitebrowser

# View PostgreSQL database
echo '--------------------------------'
echo 'sudo apt-get install -y pgadmin3'
sudo apt-get install -y pgadmin3

echo '+++++++++++++++++++++++'
echo 'Begin installing Docker'
echo '+++++++++++++++++++++++'

# DOCKER PREREQUISITES
echo '-------------------------------------------------------------------------------------------'
echo 'sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common'
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

echo '------------------------------------'
echo 'sudo apt-get install -y libapparmor1'
sudo apt-get install -y libapparmor1

echo '--------------------------------------'
echo 'sudo apt-get install -y cgroupfs-mount'
sudo apt-get install -y cgroupfs-mount

echo '----------------------------------------------------------------------------'
echo 'curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -'
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo '------------------------------------------'
echo 'Adding /etc/apt/sources.list.d/docker.list'

SOURCE_DOCKER="deb https://download.docker.com/linux/debian stretch stable"
echo $SOURCE_DOCKER | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update

# Install Docker
echo '--------------------'
echo 'Installing docker-ce'
sudo apt-get -y install docker-ce

# Provide non-root access to Docker
echo '---------------------------------'
echo 'Provide non-root access to Docker'
echo
echo 'sudo groupadd docker'
sudo groupadd docker

echo "sudo gpasswd -a ${LOGNAME} docker"
sudo gpasswd -a ${LOGNAME} docker

echo '---------------------------'
echo 'sudo service docker restart'
sudo service docker restart

wait

sh docker-version.sh
