#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Requires yay to be installed manually
# TODO: Add apt support?

# --confirm to answer yes to every prompt

for app in "git" "yay-git" "alacritty" "firefox" "gcc" "htop" "lolcat" "make" "mlocate" "neofetch" "neovim" "nitrogen" "nodejs" "npm" "zsh-git" "oh-my-zsh-git" "openssh" "picom" "polybar-git" "powerline" "powerline-fonts" "rofi" "siji-git" "ttf-font-awesome"" ttf-ionicons" "vim-plug-git" "w3m" "wget" "xclip" "yarn" "zsh-completions" "feh" "i3lock" "i3status" "i3lock-fancy-git" "mlocate" "vi" "vim" "github-desktop-bin"
do
    echo "Installing $app"
    yay -S --confirm $app
done
