# show directory and timestamp next to command line
PS1='[@\h] \D{%Y-%m-%d} \A \w: ';

# call my local Python distribution
export PATH="$HOME/anaconda3/bin:$PATH"

alias l='ls'
alias f='git fetch'
alias s='git status'
alias untar='tar -xvzf'
alias py2='source activate py2'
alias ebash='nano ~/.bash_profile'
alias sbash='source ~/.bash_profile'
alias jupy='jupyter notebook --port=#### --no-browser'
alias timeit='python -m cProfile -o'

# uploading package to pip
# alias pyup='python setup.py sdist upload'

# for windows subsystem linux
# alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'
# alias e="explorer.exe $pwd"

