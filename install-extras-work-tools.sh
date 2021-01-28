#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Requires yay to be installed manually

# --confirm to answer yes to every prompt

for app in "texlive-most" "rofi" "otf-firamath" "okular" "breeze-icons-git" "rclone" "fuse"
do
    echo "Installing $app"
    yay -S --noconfirm $app
done

for app in "pynvim" "inkscape-figures"
do
    echo "Installing $app with pip"
    python3 -m pip install --user --upgrade $app
done

