# gogopy
Get started with Python

### How to install Anaconda Python for Linux to your home directory

### You can now install by script!
`wget https://raw.githubusercontent.com/ahuang11/gogopy/master/gogopy.sh`

`bash gogopy.sh`

### Instructions to do it manually
[Video tutorial for Mac](https://www.unidata.ucar.edu/blogs/developer/entry/metpy-mondays-1-conda-installation)

Download Anaconda Python 3.6 (if you need 2.7, still install 3.6) to your home directory

	wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

Bash the downloaded file to install

	bash Anaconda3-5.2.0-Linux-x86_64.sh

Add Anaconda path to your ~/.bash_profile and/or ~/.bashrc (whichever you use; here I use ~/.bash_profile).

	echo 'export PATH=$HOME/anaconda3/bin:$PATH' >> ~/.bash_profile

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

    echo "alias jupy='jupyter notebook --no-server --port=####'" >> ~/.bash_profile


Port forwarding with Putty to access remote server's Jupyter notebook on local browser

![Port Forwarding in Putty](https://github.com/ahuang11/gogopy/blob/master/putty_config.png "Port Forwarding in Putty")

1. If you use putty, before connecting to the session, on the left, follow these tabs

	Connection > SSH > Tunnels

2. In source port replace #### with the port number you chose earlier between 7000 and 8000

	####

3. In destination add localhost:#### replacing #### with the port number you chose earlier

	localhost:####

4. Click Add

5. Now you should see it in the list

    L####       localhost:####

6. BEFORE CLICKING OPEN, head back to the Session on the left

7. Click the corresponding saved sesssion, and press Save so you don't have to repeat!

Now in your browser input the URL that `jupyter notebook --no-browser --port=####` displayed and you have access!

	Copy/paste this URL into your browser when you connect for the first time,
	    to login with a token:
		http://localhost:####/?token=????????????????????????????????????????????????

### Potentially useful packages
- numpy (np) - essential number crunching and transformation; found in most packages
- pandas (pd) - extremely useful labeled tabular data processor
- cartopy (ccrs) - succeeding `basemap` for geographic map projections
- holoviews (hv) - high level plotting API on top of `matplotlib` and `bokeh`
- geoviews (gv) - high level plotting API on top of `holoviews` for geographical maps
- datashader - big data plotter, capable of handling millions of data points
- dask - scalable, multiprocessing and easy to use wrapper
- xarray - multidimensional data structure processor bult on top of `netCDF4` and `pandas`
- geopandas - GIS processor built on top of `fiona`, `pandas`, and `shapely`
- matplotlib (plt) - old fashion, but robust, data plotter
- bokeh - low level interactive data plotter
- scikit-learn - machine learning for regression, classification, clustering
- keras - high level deep learning API on top of `tensorflow` and `theano`
- metpy - collection of tools for meteorology
- xesmf - high level geospatial regridding and interpolation on top of `esmpy`

#### Demonstration topics
See some of these packages demonstrated [here!](https://github.com/ahuang11/gogopy/blob/master/random_examples.pdf)
- Why not jet
- Read csv
- High level plotting
- Interactive plotting
- Read unformatted tables
- Read netcdf
- Get climatology
- Get daily anaomalies
- Interactive map
- Read grib
- Read plain binary / flatfiles
- Read shapefile
- Geographical maps

#### `pip install` vs `conda install`
- `pip install` runs much quicker than than `conda install`
- `pip install` works best for standalone packages that doesn't require complex compiling
- `conda install` is useful with packages that require complex compiling (e.g. cartopy, gdal)
- In most cases, follow the `Installation Instructions` page from documentation
- Or just try doing `pip install packagename`
- If that fails, `conda install packagename` or `conda install -c conda-forge packagename`

### Additional Resources

For a wonderfully written data science handbook

https://jakevdp.github.io/PythonDataScienceHandbook/

For standard Python styling guidelines

https://www.python.org/dev/peps/pep-0008/

Useful Jupyter magic

    %timeit
    %load some_file.py

Make Jupyter notebook aware of other virtual environments

    source activate some_environment
    pip install ipykernel

Add Jupyter extensions

    conda install -c conda-forge jupyter_contrib_nbextensions

Make Jupyter cell width take up whole screen

    from IPython.core.display import display, HTML
    display(HTML("<style>.container { width:100% !important; }</style>"))

For those who need grib

    conda create --name pynio --channel conda-forge/label/dev python=3.6 xarray pynio
    conda install gdal
    conda install libgdal
    source activate pynio

My philosophy: personalize your setup; it'll make coding that much more enjoyable!

Here's my setup:
- Jupyter notebook (interactive prototyping)
- Sublime Text 3 (production code scripting; [demonstration GIF](https://www.sublimetext.com/))
- MobaXterm (side by side SSH and WinSCP and tabs)

Ideas for personalizing:
- Set up your favorite keyboard shortcuts (like ctrl + v for pasting in terminal)
- Write aliases for common commands (see my [.bash_profile](https://github.com/ahuang11/gogopy/blob/master/.bash_profile))
- Configure settings (see my [.screenrc](https://github.com/ahuang11/gogopy/blob/master/.screenrc) and [ipython_config.py](https://github.com/ahuang11/gogopy/blob/master/ipython_config.py))
