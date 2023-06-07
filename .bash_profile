# show directory and timestamp next to command line
PS1='[@\h] \D{%Y-%m-%d} \A \w: ';

alias new='conda create python=3.10 -n'
alias act='conda activate'
alias bye='conda deactivate'
alias l='ls'
alias f='git fetch'
alias s='git status'
alias untar='tar -xvzf'
alias ebash='nano ~/.bash_profile'
alias sbash='source ~/.bash_profile'
alias nano='vi'

# for working with notebooks on a compute node
# alias sshb='ssh -L ####:<NODE>:#### <IP>'
# alias jupyb='jupyter notebook --no-browser --ip "*"'

# uploading package to pip
# alias pyup='python setup.py sdist upload'

# for windows subsystem linux
# alias sb='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'
# alias e="explorer.exe $pwd"

# for conda activate to work
conda_base="dirname ~/miniforge3/bin/conda"
__conda_setup="$('$conda_base/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$conda_base/etc/profile.d/conda.sh" ]; then
        . "$conda_base/etc/profile.d/conda.sh"
    else
        export PATH="$conda_base/bin:$PATH"
    fi
fi
unset __conda_setup
