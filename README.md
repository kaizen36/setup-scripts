# setup-scripts

A bunch of useful setup scripts when starting from scratch.

They should be run in the following order:

```
sudo apt-get install git
git clone https://github.com/kaizen36/setup-scripts.git
cd setup-scripts
```

Install essential development tools and Python 3
```
. debian/install.sh 
```

Install virtualenv and jupyter
```
. py/install-virtualenv.sh
```

You can now create new python projects using
```
create_project my-new-project
```

Setup git config for writing back to git
```
. git/setup-git.sh
```
