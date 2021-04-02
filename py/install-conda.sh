#!/bin/bash

# https://docs.conda.io/projects/conda/en/latest/user-guide/install/rpm-debian.html

# Install our public GPG key to trusted store
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg

# Check whether fingerprint is correct (will output an error message otherwise)
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806

# Add our Debian repo
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list

# Install it
apt update
apt install conda

# Setup
echo "# Conda
source /opt/conda/etc/profile.d/conda.sh

function create_project {
    if [ -z \"\$1\" ]; then 
        echo "Provide a project name."
        echo "create_project PROJECT_NAME"
        return
    fi

    conda create --name \$1
    conda activate \$1
}
" >> $HOME/.bash_aliases
source $HOME/.bash_aliases
echo "Conda installed."
conda -V

# Cleanup
rm conda.gpg

echo "Install jupyter lab: conda install -c conda-forge jupyterlab"
