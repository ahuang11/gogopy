#!/usr/bin/env bash

profile=~/.bash_profile
conda=$HOME/anaconda3/bin/conda
pip=$HOME/anaconda3/envs/py3/bin/pip

echo Hello, welcome to gogopy, a quick Python setup tool.
echo Please pick a number between 7000 and 8000.
printf "It will be used as your notebook port number:\n\n"

read port

echo Thank you. $port_number was chosen. You can change it at $profile.
printf "Your installation will now begin--come back in half an hour or so.\n\n"

echo Begin downloading Anaconda 3.
wget -nc https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
printf "Download complete.\n\n"

echo Installing the base Python 3 environment.
bash Anaconda3-2019.10-Linux-x86_64.sh -b  # run quietly
printf "Base installation complete.\n\n"

echo Exporting your Anaconda distribution to $profile
printf '\n# Added by gogopy bash script.\n' >> $profile
echo 'export PATH=$HOME/anaconda3/bin:$PATH' >> $profile
printf "Export path complete.\n\n"

echo Upgrading your Anaconda to the latest version.
$conda init bash
$conda update -n base -c defaults conda -y
printf "Conda upgrade complete.\n\n"

echo Installing Jupyter extensions.
$conda install -c conda-forge nb_conda jupyter_contrib_nbextensions -y

echo Creating a Python 3 environment with most of the packages you need.
$conda create -n py3 python=3.7 -y
$conda install --name py3 -c conda-forge cartopy esmpy datashader -y
$pip install -U pip
$pip install -U autopep8 netCDF4 h5py xarray dask ipykernel ipywidgets xesmf holoviews geoviews hvplot
printf "Prepared 'py3' Python 3 environment.\n\n"

echo Creating a Python 2 environment with bare minimum.
$conda create -n py2 python=2.7 -y
$conda install --name py2 jinja2 numpy -y
printf "Created 'py2' Python 2 environment.\n\n"

echo Adding alias jupy to your $profile to run Jupyter notebook.
echo "alias jupy='jupyter notebook --no-browser --port=$port'" >> $profile
printf "Added alias 'jupy' in profile.\n\n"

echo Great. Your Python distribution is almost ready to go.

echo Configuring Jupyter notebook defaults
wget https://raw.githubusercontent.com/ahuang11/gogopy/master/ipython_config.py
mkdir ~/.ipython/profile_default/
mv ipython_config.py ~/.ipython/profile_default/
mkdir $(jupyter --data-dir)/nbextensions
mkdir $(jupyter --data-dir)/nbextensions/snippets/
wget https://raw.githubusercontent.com/ahuang11/gogopy/master/snippets.json
mv snippets.json $(jupyter --data-dir)/nbextensions/snippets/
printf "Configured Jupyter notebook.\n\n"

echo You need to manually setup port forwarding on Putty
echo If you need help: https://github.com/ahuang11/gogopy

echo Cleaning up installation files.
rm Anaconda3-2019.10-Linux-x86_64.sh
printf "All done! Just restart your terminal or source $profile\n\n"
