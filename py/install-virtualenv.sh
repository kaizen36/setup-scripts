#!/bin/bash

pip install virtualenv virtualenvwrapper jupyter jupyterlab

read -e -p "Path to environment files [$HOME/envs]: :" -i "$HOME/envs" ENVS
mkdir -p $ENVS

echo "# Virtualenv
export WORKON_HOME=${ENVS}
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source $HOME/.local/bin/virtualenvwrapper.sh

function create_project {
    if [ -z \"\$1\" ]; then 
        echo "Provide a project name."
        echo "$ ./new-project-virtualenv.sh PROJECT_NAME"
        return
    fi

    mkvirtualenv \$1
    pip install ipykernel
    python -m ipykernel install --user --name \$1 --display-name \$1
}
" >> $HOME/.bash_aliases

source $HOME/.bash_aliases
