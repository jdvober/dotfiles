#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Requires yay to be installed manually
# TODO: Add apt support?

# --confirm to answer yes to every prompt

for app in "vi" "vim" "git" "yay-git" "alacritty" "firefox" "gcc" "htop" "yarn" "lolcat" "make" "mlocate" "neofetch" "neovim" "nitrogen" "nodejs" "npm" "zsh-git" "oh-my-zsh-git" "openssh" "picom" "polybar-git" "powerline" "powerline-fonts" "rofi" "vim-plug-git" "w3m" "wget" "xclip" "zsh-completions" "feh" "i3lock" "i3status" "i3lock-fancy-git" "mlocate" "github-desktop-bin" "autoconf" "automake" "geany" "ripgrep" "dust" "nerd-fonts-iosevka" "termsyn-font" "font-manager" "ttf-fira-code" "ttf-monoid" "nerd-fonts-jetbrains-mono" "siji-git" "ttf-font-awesome"" ttf-ionicons" 
do
    echo "Installing $app"
    yay -S --noconfirm $app
done
