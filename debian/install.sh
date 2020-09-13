#!/bin/bash

sudo ./debian/development-tools.sh

# Copy rc files
echo ""
files=("bash_aliases" "vimrc")
for file in "${files[@]}"; do
    if [ -f "$HOME/.$file" ]; then 
	cat ./debian/rc/$file >> $HOME/.$file
        echo "${HOME}/.${file} has been appended"
    else
	cp ./debian/rc/$file $HOME/.$file
        echo "${HOME}/.${file} has been added"
    fi
done

source $HOME/.bash_aliases

# install Vundle plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install Python
sudo ./debian/install-python-3.sh

echo ""
echo "Start a new shell and verify the python installation:"
echo "$ python -V"
echo "$ pip -V"
