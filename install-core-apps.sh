#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Requires yay to be installed manually
# TODO: Add apt support?

# --confirm to answer yes to every prompt

# Install yay
    echo "Installing Reflector for updated mirror list..."
    cd ~
    sudo pacman -S --noconfirm "reflector"
    echo "Installing git..."
    sudo pacman -S --noconfirm "git"

    echo "Installing yay AUR helper..."
    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R jdv:jdv ./yay-git
    cd yay-git
    makepkg -si

for app in "xorg-xinit" "lightdm" "xorg-server" "vi" "vim" "alacritty" "alsa-utils" "alsa-plugins" "firefox" "gcc" "rustup" "htop" "gtop" "yarn" "lolcat" "make" "mlocate" "pcmanfm" "neofetch" "pfetch" "neovim-nightly" "nitrogen" "nodejs" "npm" "zsh-git" "oh-my-zsh-git" "openssh" "asciidoc" "picom-ibhagwan-git" "pacman-contrib" "powerline-fonts" "dmenu2" "vim-plug-git" "w3m" "wget" "xclip" "zsh-completions" "lscolors-git" "fzf" "feh" "i3lock" "betterlockscreen-git" "shell-color-scripts" "qtile-git" "mlocate" "autoconf" "automake" "neovim-gtk" "ripgrep" "exa" "dust" "broot" "scrot" "pantheon-screenshot" "vscode" "evince" "mupdf" "github-desktop-bin" "xf86-input-wacom" "usbutils"
do
    echo "Installing $app"
    yay -S --noconfirm $app
done

# Install Lightdm greeter and webkit2 theme
echo "Setting up Lightdm"
sudo pacman -S --needed lightdm-webkit2-greeter lightdm-webkit-theme-litarvan

# Clean up system
sudo yay -Yc

# Install fonts
    for font in "korla-icon-theme-git" "nerd-fonts-iosevka" "termsyn-font" "font-manager" "ttf-fira-code" "ttf-monoid" "nerd-fonts-jetbrains-mono" "ttf-jetbrains-mono" "siji-git" "ttf-font-awesome"" ttf-ionicons" 
    do
        echo "Installing $font font..."
        yay -S --noconfirm $font
    done

