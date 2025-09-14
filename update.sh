#!/bin/zsh


cp ~/.config/emacs/init.el .
cp ~/.zshrc .
cp ~/.config/kitty/kitty.conf .

git add .
git commit -m "Update config files..."
git push
