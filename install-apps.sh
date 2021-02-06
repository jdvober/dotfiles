#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Options:
# --yay
# --paru
# --extras
# --work
# --language-servers
# --pia

install_base_utils
install_aur_helper
install_text_editors
install_term
install_graphics
install_fonts
install_audio
install_core_apps

# Optional packages
if [ -o extras ]; then
    install_extras
fi

if [ -o work ]; then
    install_work
fi

if [ -o language-servers ]; then
    install_language_servers
fi

if [ -o pia ]; then
    install_pia
fi


install_aur_helper(){
    # Install AUR Helper
    if [ -o yay ]; then
        AUR_HELPER="yay"
        install_yay
    elif [ -o paru ]; then
        AUR_HELPER="paru"
        install_paru
    else
        echo "${Red}==> Error:${Reset} Please set AUR_HELPER to either ${Cyan}yay${Reset} or ${Cyan}paru${Reset} at the beginning of the script, and rerun."
    fi
}

install_yay()
{
    echo "Installing ${Cyan}yay${Reset} AUR helper..."
    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R jdv:jdv ./yay-git
    cd yay-git
    makepkg -si
    echo_done
}

install_paru()
{
    echo "Installing ${Cyan}paru${Reset} AUR helper..."
    cd /home/jdv
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    echo_done
}

install_base_utils()
{
    echo "Installing ${Cyan}Base${Reset} ${Cyan}Utilities${Reset} needed to proceed with installation..."

    # Install Reflector
    echo "Installing ${Cyan}Reflector${Reset} for updated mirror list..."
    cd ~
    sudo pacman -S --noconfirm "reflector"
    echo_done

    # Install Vim
    echo "Installing ${Cyan}vim${Reset}..."
    sudo pacman -S --noconfirm "vi" "vim"
    echo_done

    # Install git
    echo "Installing ${Cyan}git${Reset}..."
    sudo pacman -S --noconfirm "git"
    echo_done

    echo "Installing ${Cyan}gcc..."${Reset}
    sudo pacman -S --noconfirm "gcc"
    echo_done

    echo "Installing ${Cyan}make${Reset}..."
    sudo pacman -S --noconfirm "make"
    echo_done

    # Install go
    echo "Installing ${Cyan}go${Reset} and related utilities..."
    sudo pacman -S --noconfirm "go" "go-tools"
    echo_done

    # Install rust and update Rust Toolchain
    echo "Installing ${Cyan}rust${Reset} and related utilities..."
    sudo pacman -S --noconfirm "rustup"
    rustup install stable
    rustup default stable
    echo_done

    # Install Python3 and pynvim
    echo "Installing ${Cyan}python${Reset} and related utilities..."
    sudo pacman -S --noconfirm "python" "python-pynvim"
    echo_done

    # Install nodejs, yarn and npm
    echo "Installing ${Cyan}nodejs${Reset}, ${Cyan}npm${Reset} and ${Cyan}yarn${Reset}..."
    sudo pacman -S --noconfirm "nodejs" "npm" "yarn"
    echo_done

    # Misc
    for app in "p7zip" "unrar" "tar" "rsync"
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Black_On_White}Done installing ${Cyan}${app}${Reset}"

    echo "<${Green}Done installing Base Utils.  Proceeding.${Reset}>"
}

install_graphics()
{
    echo "${Black_On_White}Installing packages needed for graphics (xorg, wm, greeter etc.)${Reset}"

    # Xorg
    echo "${Blue_On_White}Installing xorg${Reset}"
    for app in "xorg" "xorg-xinit" "xorg-server"
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Blue_On_White}Done installing ${Cyan}${app}${Reset}"

    # Desktop Environments and Window Managers
    echo "${Blue_On_White}Installing Desktop Environments and Window Managers${Reset}"
    for app in "plasma" "qtile" "nitrogen" "picom-ibhagwan-git" 
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Blue_On_White}Done installing ${Cyan}${app}${Reset}"

    # Greeter
    echo "${Blue_On_White}Installing Greeter${Reset}"
    # Install Lightdm greeter and webkit2 theme
    echo "Setting up Lightdm"
    sudo pacman -S --needed lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
    echo "${Blue_On_White}Done installing ${Cyan}${app}${Reset}"

    echo "${Black_On_White}Done installing packages needed for graphics${Reset}"

}

install_text_editors()
{
    echo "${Black_On_White}Installing extra text editors.${Reset}"
    for app in "neovim-nightly-bin" "vim-plug-git" "neovim-gtk" "vscode" 
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Black_On_White}Done installing extra text editors${Reset}"
}

install_fonts(){
    # Install fonts
    echo "${Black_On_White}Installing Core Apps${Reset}"
    for font in "korla-icon-theme-git" "nerd-fonts-iosevka" "termsyn-font" "font-manager" "ttf-fira-code" "ttf-monoid" "nerd-fonts-jetbrains-mono" "ttf-jetbrains-mono" "siji-git" "ttf-font-awesome"" ttf-ionicons" "ttf-liberation" "otf-firamath"
    do
        echo "Installing ${Cyan}${font}${Reset}"
        ${AUR_HELPER} -S --noconfirm $font
    done
    echo "${Black_On_White}Done installing fonts${Reset}"
}

install_core_apps()
{
    echo "${Black_On_White}Installing Core Apps${Reset}"
    for app in "sudo" "doas" "firefox" "pcmanfm" "openssh" "dmenu2" "w3m" "feh" "i3lock" "betterlockscreen-git" "autoconf" "automake" "pantheon-screenshot" "evince" "mupdf" "okular" "breeze-icons-git" "github-desktop-bin" "xf86-input-wacom" "usbutils" "fx" "vlc" "rofi"
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Black_On_White}Done installing Core Apps${Reset}"
}

install_extras()
{
    echo "${Black_On_White}Installing Optional Apps${Reset}"
    for app in "libreoffice" "gimp" "inkscape" "audacity" "thunderbird" "obs-studio" "discord" "timeshift" "joplin" "brave-bin" 
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Black_On_White}Done installing Optional Apps${Reset}"
}

install_work()
{
    echo "${Black_On_White}Installing Work Apps${Reset}"
    for app in "texlive-most" "rclone" "fuse"
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done

    for app in "inkscape-figures"
    do
        echo "Installing ${Cyan}${app}${Reset} with pip"
        python3 -m pip install --user --upgrade $app
    done

    echo "${Black_On_White}Done installing Work Apps${Reset}"
}

install_language_servers(){
    echo "${Black_On_White}Installing Language Servers${Reset}"
    for app in "bash-language-server" "vscode-html-languageserver-bin" "vscode-json-languageserver" "typescript-language-server" "vls" "yaml-language-server" 
    do
        echo "Installing ${Cyan}${app}${Reset}"
        sudo npm install -g $app
    done
    
    for app in "jedi-language-server"
    
    do
        echo "Installing ${Cyan}${app}${Reset}"
        pip install -U $app
    done
    
    for app in "lua-language-server-git" "gopls" "delve"
    
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S $app
    done

    echo "${Black_On_White}Done installing Language Servers${Reset}"
}

install_audio()
{
    echo "${Black_On_White}Installing Audio related packages.${Reset}"
    for app in "alsa-utils" "alsa-plugins" "pulseaudio" "pulseaudio-alsa" "moc-alsa" "ncmpcpp"   
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Black_On_White}Done installing Audio related packages${Reset}"
}

install_term()
{
    echo "${Black_On_White}Installing terminal modifications.${Reset}"
    for app in "alacritty" "htop" "gtop" "lolcat" "mlocate" "neofetch" "pfetch" "zsh-git" "oh-my-zsh-git" "asciidoc" "pacman-contrib" "neofetch" "pfetch" "zsh-git" "oh-my-zsh-git" "powerline-fonts" "wget" "xclip" "zsh-completions" "lscolors-git" "fzf" "mlocate" "ripgrep" "exa" "dust" "broot" "scrot"   
    do
        echo "Installing ${Cyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo "${Black_On_White}Done installing terminal modifications${Reset}"
}

install_pia()
{
    echo "${Black_On_White}Getting PIA Installer.  Run sh pia-linux-XXXXXXXXXXX after script finishes.${Reset}"
    # Check if Downloads exists
    if [ ! (-e /home/jdv/Downloads) ]
        mkdir ~/Downloads
    fi
    cd ~/Downloads
    wget https://www.privateinternetaccess.com/installer/download_installer_linux_beta
    echo "${Black_On_White}Done${Reset}"
}

echo_done()
{
    echo "<${Green}DONE${Reset}>"
}


# Text colors
# example 1
# \e[32m<text>\e[0m <-- Green text that returns to regular font color

# example 2
# echo ${Green}<text>${Reset} <-- Green text that returns to regular font color

# Reset
Color_Off='\e[0m'       # Text Reset
Reset='\e[0m'       # Text Reset

# Regular Colors
Black='\e[30m'        # Black
Red='\e[31m'          # Red
Green='\e[32m'        # Green
Yellow='\e[33m'       # Yellow
Blue='\e[34m'         # Blue
Purple='\e[35m'       # Purple
Cyan='\e[36m'         # Cyan
White='\e[37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'           # Black
On_Red='\e[41m'             # Red
On_Green='\e[42m'           # Green
On_Yellow='\e[43m'          # Yellow
On_Blue='\e[44m'            # Blue
On_Purple='\e[45m'          # Purple
On_Cyan='\e[46m'            # Cyan
On_White='\e[47m'           # White
Black_On_White='\e[30;47m'  # Black on White
Blue_On_White='\e[34;47m'   # Blue on White

# High Intensity
IBlack='\e[90m'       # Black
IRed='\e[91m'         # Red
IGreen='\e[92m'       # Green
IYellow='\e[93m'      # Yellow
IBlue='\e[94m'        # Blue
IPurple='\e[95m'      # Purple
ICyan='\e[96m'        # Cyan
IWhite='\e[97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[100m'   # Black
On_IRed='\e[101m'     # Red
On_IGreen='\e[102m'   # Green
On_IYellow='\e[103m'  # Yellow
On_IBlue='\e[104m'    # Blue
On_IPurple='\e[105m'  # Purple
On_ICyan='\e[106m'    # Cyan
On_IWhite='\e[107m'   # White
