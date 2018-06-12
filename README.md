# gogopy
Get started with Python

### How to install Anaconda Python for Linux to your home directory (for Mac https://www.unidata.ucar.edu/blogs/developer/entry/metpy-mondays-1-conda-installation)

Download Anaconda Python 3.6 (if you need 2.7, still install 3.6) to your home directory

	wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

Bash the downloaded file to install

	bash Anaconda3-5.2.0-Linux-x86_64.sh

Add Anaconda path to your ~/.bash_profile and/or ~/.bashrc (whichever you use; here I use ~/.bash_profile).

	echo 'export PATH=/users/$USER/anaconda3/bin:$PATH' >> ~/.bash_profile

Source (install) your ~/.bash_profile or ~/.bashrc

	source ~/.bash_profile

For those who need Python 2.7

	conda create -n py2 python=2.7
  
To activate the environment

  source activate py2

Install additional packages using pip or conda install

	conda install -c conda-forge cartopy

	pip install geopandas

### How to start using Jupyter notebooks

Change the port number between 7000 and 8000, and in a terminal input the following

	jupyter notebook --no-server --port=####

For your convenience, add a shortcut called "jupy" to your ~/.bash_profile to activate

	echo 'alias jupy=jupyter notebook --no-server --port=####' >> ~/.bash_profile

(http://realprogrammers.com/how_to/set_up_an_ssh_tunnel_with_putty.html with pictures for the following steps)
If you use putty, before connecting to the session, on the left, follow these tabs

	Connection > SSH > Tunnels

In source port replace #### with the port number you chose earlier between 7000 and 8000

	####

In destination add localhost:#### replacing #### with the port number you chose earlier

	localhost:####

BEFORE CLICKING OPEN, head back to the Session on th left, click your saved sesssion, and press Save so you don't have to repeat!

Now in your browser input the URL that jupyter notebook --no-server --port=#### displayed and you have access!

	Copy/paste this URL into your browser when you connect for the first time,
	    to login with a token:
		http://localhost:####/?token=????????????????????????????????????????????????

### Random Resources

For those who need grib

	conda create --name py3 --channel conda-forge/label/dev python=3.6 xarray pynio
	source activate py3

