#!/usr/bin/env bash

profile=~/.bash_profile

echo Hello, welcome to gogopy, a quick Python setup tool.
echo Please pick a number between 7000 and 8000.
printf "It will be used as your notebook port number:\n\n"

read port

echo Thank you. $port_number was chosen. You can change it at $profile.
printf "Your installation will now begin--come back in half an hour or so.\n\n"

echo Begin downloading Miniconda 3, a lite version of Anaconda.
wget -nc https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
printf "Download complete.\n\n"

echo Installing the base Python 3 environment.
bash Miniconda3-latest-Linux-x86_64.sh -b  # run quietly
printf "Base installation complete.\n\n"

echo Exporting your conda distribution to $profile
printf '\n# Added by gogopy bash script.' >> $profile
echo 'export PATH=$HOME/miniconda3/bin:$PATH' >> $profile
source $profile
printf "Export path complete.\n\n"

echo Upgrading your Miniconda to the latest version.
conda upgrade conda -y
printf "Conda upgrade complete.\n\n"

echo Installing a Python 3 environment with most of the packages you need.
wget -nc https://github.com/ahuang11/gogopy/blob/master/gogopy.yml
conda env create -f gogopy.yml
printf "Created 'gogopy' Python 3 environment.\n\n"

echo "alias gogopy='source activate gogopy'" >> $profile
echo 'export PATH=$HOME/miniconda3/bin:$PATH' >> $profile
printf "Added alias 'gogopy' in profile.\n\n"

echo Creating a Python 2 environment with bare minimum.
conda create -n test python=2.7 -y
conda install --name py2 jinja2 numpy -y
printf "Created 'py2' Python 2 environment.\n\n"

echo Adding alias jupy to your $profile to run Jupyter notebook.
echo "alias jupy='jupyter notebook --no-server --port=$port'" >> $profile
printf "Added alias 'jupy' in profile.\n\n"

echo Great. Your Python distribution is almost ready to go.
echo "How to start using Jupyter notebooks" @ https://github.com/ahuang11/gogopy
echo will help you step by step to port forward your notebook.

echo Cleaning up installation files.
rm gogopy.yml
rm Miniconda3-latest-Linux-x86_64.sh

printf "All done! Remember to type 'gogopy' to activate your main environment.\n\n"
