#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Requires yay to be installed manually
# TODO: Add apt support?

# --confirm to answer yes to every prompt

for app in "vi" "vim" "git" "yay-git" "alacritty" "alsa-utils" "alsa-plugins" "firefox" "gcc" "rustup" "htop" "yarn" "lolcat" "make" "mlocate" "neofetch" "neovim" "nitrogen" "nodejs" "npm" "zsh-git" "oh-my-zsh-git" "openssh" "picom" "polybar-git" "powerline" "powerline-fonts" "dmenu2" "vim-plug-git" "w3m" "wget" "xclip" "zsh-completions" "lscolors-git" "feh" "i3lock" "i3status" "i3lock-fancy-git" "shell-color-scripts" "qtile-git" "mlocate" "github-desktop-bin" "autoconf" "automake" "geany" "neovim-gtk" "ripgrep" "dust" "broot" "scrot" "pantheon-screenshot" "nerd-fonts-iosevka" "termsyn-font" "font-manager" "ttf-fira-code" "ttf-monoid" "nerd-fonts-jetbrains-mono" "ttf-jetbrains-mono" "siji-git" "ttf-font-awesome"" ttf-ionicons" 
do
    echo "Installing $app"
    yay -S --noconfirm $app
done
