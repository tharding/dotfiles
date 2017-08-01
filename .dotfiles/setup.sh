#!/bin/sh

git clone --bare https://github.com/tharding/dotfiles.git $HOME/.cfg

EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]
then
    exit $EXIT_CODE
fi

function dotfiles {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .config-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no

# Add profiles to the user's environment
echo "for f in ~/.profiles/*; do source \$f; done" >> ~/.bash_profile
