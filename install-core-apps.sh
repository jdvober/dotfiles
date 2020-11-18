#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Requires yay to be installed manually
# TODO: Add apt support?

# --confirm to answer yes to every prompt

install_yay()
install_apps()
install_fonts()


# Install yay
install_yay() {
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
}


install_apps() {
for app in "vi" "vim" "alacritty" "alsa-utils" "alsa-plugins" "firefox" "gcc" "rustup" "htop" "gtop" "yarn" "lolcat" "make" "mlocate" "pcmanfm" "neofetch" "pfetch" "neovim" "nitrogen" "nodejs" "npm" "zsh-git" "oh-my-zsh-git" "openssh" "asciidoc" "picom-ibhagwan-git" "polybar-git" "pacman-contrib" "powerline-fonts" "dmenu2" "vim-plug-git" "w3m" "wget" "xclip" "zsh-completions" "lscolors-git" "feh" "i3lock" "i3status" "i3lock-fancy-git" "shell-color-scripts" "qtile-git" "mlocate" "github-desktop-bin" "autoconf" "automake" "geany" "neovim-gtk" "ripgrep" "dust" "broot" "scrot" "pantheon-screenshot" "vscode" 
do
    echo "Installing $app"
    yay -S --noconfirm $app
done
# Clean up system
sudo yay -Yc
}

# Install fonts
install_fonts() {
    for font in "korla-icon-theme-git" "nerd-fonts-iosevka" "termsyn-font" "font-manager" "ttf-fira-code" "ttf-monoid" "nerd-fonts-jetbrains-mono" "ttf-jetbrains-mono" "siji-git" "ttf-font-awesome"" ttf-ionicons" 
    do
        echo "Installing $font font..."
        yay -S --noconfirm $font
    done
}

