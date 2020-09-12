#!/bin/bash

read -p "Git username: " USERNAME
echo "The git email can be found at https://github.com/settings/emails"
echo "It should have the format numbers+$USERNAME@users.noreply.github.com"
read -p "Git email: " EMAIL

git config --global user.name $USERNAME
git config --global user.email $EMAIL

git config --global --list
