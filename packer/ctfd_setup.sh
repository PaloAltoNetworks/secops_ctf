#!/bin/bash - 
#===========================================================
#          FILE: ctfd_setup.sh
#         USAGE: bash ctfd_setup.sh 
#   DESCRIPTION: 
#        AUTHOR: Franklin Diaz (fdiaz@paloaltonetworks.com), 
#  ORGANIZATION: 
#       CREATED: 03/31/2020 16:42
#      REVISION:  0.1
#============================================================
if [ ! -d "/home/ubuntu/CTFd" ]; then
  cd /home/ubuntu && git clone https://github.com/CTFd/CTFd.git
fi
# Setuptools v45.0.0 breaks virtualenv on Python 2
# https://github.com/pypa/virtualenv/issues/1493
sudo pip install --upgrade 'setuptools<45.0.0'
cd /home/ubuntu/CTFd && sudo bash prepare.sh
sudo bash /home/ubuntu/CTFd/scripts/install_docker.sh
#sudo newgrp docker
# Make this a cron entry
#screen -d -m docker run -p 8000:8000 -it ctfd/ctfd