#!/usr/bin/env bash

echo Hello, welcome to gogopy, a quick Python setup tool.
echo Please pick a number between 7000 and 8000.
printf "It will be used as your notebook port number:\n"

read port

echo Thank you! $port_number was chosen. You can change it at ~/.bash_profile.
echo Your installation will now begin--come back in half an hour or so!

echo Begin downloading Miniconda 3, a lite version of Anaconda.
wget -nc https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

echo Installing a Python 3 environment with most of the packages you need.
bash Miniconda3-latest-Linux-x86_64.sh -b

echo Upgrading your Miniconda to the latest version.
conda upgrade conda -y

echo Exporting your conda distribution to ~/.bash_profile
echo 'export PATH=/users/$USER/miniconda3/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

echo Installing a Python 3 environment with most of the packages you need.
wget https://github.com/ahuang11/gogopy/blob/master/gogopy.yml
conda create -n gogopy create -f gogopy.yml -y

echo Creating a Python 2 environment with minimal packages.
conda create -n py2 python=2.7 -y

echo Adding alias jupy to your ~/.bash_profile to run Jupyter notebook.
echo 'alias jupy=jupyter notebook --no-server --port=$port' >> ~/.bash_profile

echo Great! Your Python is ready to go!
echo Follow https://github.com/ahuang11/gogopy if you need help port forwarding.
