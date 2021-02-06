#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!
# Options:
 
# -h --help
# Displays this help menu

# -c --core
# Set up the initial system.  This can be skipped if the script has already installed the core utilities.

# -a yay | paru
# --aur-helper yay | paru
# Choose an AUR Helper

# -e --extra
# Install the "extra" apps that may not always be necessary.
 
# -w --work
# Install tools only used at work
 
# -l --language-server
# Install language servers for Neovim
 
# -p --pia
# Download the latest Private Internet Access install file, so it is ready to go in ~/Downloads


# Flags
# https://www.lifewire.com/pass-arguments-to-bash-script-2200571
# https://stackoverflow.com/questions/18414054/reading-optarg-for-optional-flags

AUR_HELPER=false
CORE=false
EXTRA=false
HELP=TRUE
LANGUAGE_SERVER=false
PIA=FALSE
WORK=FALSE

if [[ "$1" =~ ^((-{1,2})([Hh]$|[Hh][Ee][Ll][Pp])|)$ ]]; then
    print_usage; exit 1
else
  while [[ $# -gt 0 ]]; do
    opt="$1"
    shift;
    current_arg="$1"
    if [[ "$current_arg" =~ ^-{1,2}.* ]]; then
      echo "WARNING: You may have left an argument blank. Double check your command." 
    fi
    case "$opt" in
      "-a"| "--aur-helper" )
                 AUR_HELPER=true;;     #set to some default value
      "-a"| "--aur-helper" )
                 AUR_HELPER="$1"; shift;; #take argument
      "-a=*"| "--aur-helper=*" )
                 AUR_HELPER="${opt#*=}";;             #take argument
      "-c"| "--core" )
                 CORE=true;;     #set to some default value
      "-c"| "--core" )
                 CORE="$1"; shift;; #take argument
      "-c=*"| "--core=*" )
                 CORE="${opt#*=}";;             #take argument
      "-e"| "--extra" )
                 EXTRA=true;;     #set to some default value
      "-e"| "--extra" )
                 EXTRA="$1"; shift;; #take argument
      "-e=*"| "--extra=*" )
                 EXTRA="${opt#*=}";;             #take argument
      "-h"| "--help" )
                 HELP=true;;     #set to some default value
      "-h"| "--help" )
                 HELP="$1"; shift;; #take argument
      "-h=*"| "--help=*" )
                 HELP="${opt#*=}";;             #take argument
      "-l"| "--language-server" )
                 LANGUAGE_SERVER=true;;     #set to some default value
      "-l"| "--language-server" )
                 LANGUAGE_SERVER="$1"; shift;; #take argument
      "-l=*"| "--language-server=*" )
                 LANGUAGE_SERVER="${opt#*=}";;             #take argument
      "-p"| "--pia" )
                 PIA=true;;     #set to some default value
      "-p"| "--pia" )
                 PIA="$1"; shift;; #take argument
      "-p=*"| "--pia=*" )
                 PIA="${opt#*=}";;             #take argument
      "-w"| "--work" )
                 WORK=true;;     #set to some default value
      "-w"| "--work" )
                 WORK="$1"; shift;; #take argument
      "-w=*"| "--work=*" )
                 WORK="${opt#*=}";;             #take argument
      *                         ) echo "ERROR: Invalid option: \""$opt"\"" >&2
                                  exit 1;;
    esac
  done
fi

if [[ "$AUR_HELPER" == ""  ]]; then
  echo "ERROR: Option -a requires either yay or paru" >&2
  exit 1
fi

# Help Menu
__usage="
Usage: $(basename $0) [OPTIONS]

Options:
  -a, --aur-helper          Choose an AUR Helper
  -c, --core                Set up the initial system.  This can be skipped if the script has already installed the core utilities.
  -e, --extra               Install the extra apps that may not always be necessary.
  -h, --help                Displays this menu
  -l, --language-server     Install language servers for Neovim
  -p, --pia                 Download the latest Private Internet Access install file, so it is ready to go in ~/Downloads
  -w, --work                Install tools only used at work
"
if [ "$HELP" == "true" ]; then
    echo "$__usage"
    exit 1
fi


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

install_aur_helper(){
    # Install AUR Helper
    if [ "$AUR_HELPER" == "yay" ]; then
        install_yay
    elif [ "$AUR_HELPER" == "paru" ]; then
        install_paru
    else
        echo "${Red}==> Error:${Reset} Please set AUR_HELPER to either ${Cyan}yay${Reset} or ${Cyan}paru${Reset} at the beginning of the script, and rerun."
        exit 1
    fi
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
    if [ ! -e /home/jdv/Downloads ]; then
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
# \033[32m<text>\033[0m <-- Green text that returns to regular font color

# example 2
# echo ${Green}<text>${Reset} <-- Green text that returns to regular font color

# Reset
Reset='\033[om'       # Text Reset

# Regular Colors
Black='\033[30m'        # Black
Red='\033[31m'          # Red
Green='\033[32m'        # Green
Yellow='\033[33m'       # Yellow
Blue='\033[34m'         # Blue
Purple='\033[35m'       # Purple
Cyan='\033[36m'         # Cyan
White='\033[37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'           # Black
On_Red='\033[41m'             # Red
On_Green='\033[42m'           # Green
On_Yellow='\033[43m'          # Yellow
On_Blue='\033[44m'            # Blue
On_Purple='\033[45m'          # Purple
On_Cyan='\033[46m'            # Cyan
On_White='\033[47m'           # White
Black_On_White='\033[30;47m'  # Black on White
Blue_On_White='\033[34;47m'   # Blue on White

# High Intensity
IBlack='\033[90m'       # Black
IRed='\033[91m'         # Red
IGreen='\033[92m'       # Green
IYellow='\033[93m'      # Yellow
IBlue='\033[94m'        # Blue
IPurple='\033[95m'      # Purple
ICyan='\033[96m'        # Cyan
IWhite='\033[97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[100m'   # Black
On_IRed='\033[101m'     # Red
On_IGreen='\033[102m'   # Green
On_IYellow='\033[103m'  # Yellow
On_IBlue='\033[104m'    # Blue
On_IPurple='\033[105m'  # Purple
On_ICyan='\033[106m'    # Cyan
On_IWhite='\033[107m'   # White


# Install packages
if [ "$CORE" == "true" ];then
    install_base_utils
    install_aur_helper
    install_text_editors
    install_term
    install_graphics
    install_fonts
    install_audio
    install_core_apps
fi

# Optional packages
if [ "$EXTRAS" == "true" ];then
    install_extras
fi

if [ "$WORK" == "true" ];then
    install_work
fi

if [ "$LANGUAGE_SERVER" == "true" ];then
    install_language_servers
fi

if [ "$PIA" == "true" ];then
    install_pia
fi



