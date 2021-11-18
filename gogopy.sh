#!/usr/bin/env bash

profile=~/.bash_profile
conda=$HOME/miniforge3/bin/conda
mamba=$HOME/miniforge3/bin/mamba
pip=$HOME/miniforge3/envs/py3/bin/pip
miniforge=Miniforge3-Linux-x86_64.sh

echo Hello, welcome to gogopy, a quick Python setup tool.
echo Please pick a number between 7000 and 8000.
printf "It will be used as your notebook port number:\n\n"

read port

echo Thank you. $port_number was chosen. You can change it at $profile.
printf "Your installation will now begin--come back in half an hour or so.\n\n"

echo Begin downloading miniforge 3.
wget -nc https://github.com/conda-forge/miniforge/releases/latest/download/$miniforge
printf "Download complete.\n\n"

echo Installing the base Python 3 environment.
bash $miniforge -b  # run quietly
printf "Base installation complete.\n\n"

echo Exporting your miniforge distribution to $profile
printf '\n# Added by gogopy bash script.\n' >> $profile
echo 'export PATH=$HOME/miniforge3/bin:$PATH' >> $profile
printf "Export path complete.\n\n"

echo Upgrading your miniforge to the latest version.
$mamba init bash
$mamba install -n base jupyter nb_conda_kernels nodejs -y
printf "Conda upgrade complete.\n\n"

echo Creating a Python 3 environment with most of the packages you need.
$mamba create -n py3 python=3.10 -y
$mamba install --name py3 cartopy xesmf datashader ipykernel -y
$pip install -U pip
$pip install -U autopep8 netCDF4 h5py xarray dask holoviews geoviews hvplot panel
printf "Prepared 'py3' Python 3 environment.\n\n"

echo Adding alias jupy to your $profile to run Jupyter notebook.
echo "alias jupy='jupyter notebook --no-browser --port=$port'" >> $profile
printf "Added alias 'jupy' in profile.\n\n"

echo Adding my profile defaults
mkdir -p $HOME/.ipython/profile_defaults
wget https://raw.githubusercontent.com/ahuang11/gogopy/master/ipython_config.py -P $HOME/.ipython/profile_defaults

echo Adding my common snippets
mkdir -p $HOME/.local/share/jupyter/nbextensions/snippets
wget https://raw.githubusercontent.com/ahuang11/gogopy/master/snippets.json -P $HOME/.local/share/jupyter/nbextensions/snippets

echo You need to manually setup port forwarding on Putty
echo If you need help: https://github.com/ahuang11/gogopy

echo Cleaning up installation files.
rm $miniforge
printf "All done! Just restart your terminal or source $profile and don't forget to `conda activate py3` before using!\n\n"
