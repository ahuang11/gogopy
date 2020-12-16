#!/usr/bin/env bash

profile=~/.bash_profile
conda=$HOME/anaconda3/bin/conda
pip=$HOME/anaconda3/envs/py3/bin/pip
anaconda=Anaconda3-2020.11-Linux-x86_64.sh

echo Hello, welcome to gogopy, a quick Python setup tool.
echo Please pick a number between 7000 and 8000.
printf "It will be used as your notebook port number:\n\n"

read port

echo Thank you. $port_number was chosen. You can change it at $profile.
printf "Your installation will now begin--come back in half an hour or so.\n\n"

echo Begin downloading Anaconda 3.
wget -nc https://repo.anaconda.com/archive/$anaconda
printf "Download complete.\n\n"

echo Installing the base Python 3 environment.
bash $anaconda -b  # run quietly
printf "Base installation complete.\n\n"

echo Exporting your Anaconda distribution to $profile
printf '\n# Added by gogopy bash script.\n' >> $profile
echo 'export PATH=$HOME/anaconda3/bin:$PATH' >> $profile
printf "Export path complete.\n\n"

echo Upgrading your Anaconda to the latest version.
$conda init bash
$conda update -n base -c defaults conda -y
$conda install -n base -c conda-forge nodejs
$conda install -n base -c conda-forge jupyterlab nb_conda_kernels -y
$conda install -n base -c conda-forge dask-labextension -y
jupyter labextension install dask-labextension
jupyter serverextension enable dask_labextension
printf "Conda upgrade complete.\n\n"

echo Creating a Python 3 environment with most of the packages you need.
$conda create -n py3 python=3.8 -y
$conda install --name py3 -c conda-forge cartopy esmpy datashader ipykernel -y
$pip install -U pip
$pip install -U autopep8 netCDF4 h5py xarray dask xesmf holoviews geoviews hvplot panel
printf "Prepared 'py3' Python 3 environment.\n\n"

echo Adding alias jupy to your $profile to run Jupyter notebook.
echo "alias jupy='jupyter lab --no-browser --port=$port'" >> $profile
printf "Added alias 'jupy' in profile.\n\n"

echo You need to manually setup port forwarding on Putty
echo If you need help: https://github.com/ahuang11/gogopy

echo Cleaning up installation files.
rm $anaconda
printf "All done! Just restart your terminal or source $profile and don't forget to `source activate py3` before using!\n\n"
