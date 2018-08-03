#!/usr/bin/env bash

wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh -b
conda upgrade conda -y

echo 'export PATH=/users/$USER/anaconda3/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

wget https://github.com/ahuang11/gogopy/blob/master/gogopy.yml
conda create -n gogopy create -f gogopy.yml -y
conda create -n py2 python=2.7 -y
