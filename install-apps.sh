#!/bin/bash
# A shell script to install all of my core utilites and dotfiles in one go, on a fresh install of Arch!

# Flags
# https://www.lifewire.com/pass-arguments-to-bash-script-2200571
# https://stackoverflow.com/questions/18414054/reading-optarg-for-optional-flags

# AUR_HELPER=false
# CORE=false
# EXTRA=false
# HELP=false
# LANGUAGE_SERVER=false
# PIA=false
# WORK=false
# PRINT_HELP=false


# Text colors
# example 1
# \033[32m<text>\033[0m <-- Green text that returns to regular font color

# example 2
# echo -e ${BIGreen}<text>${Reset} <-- Green text that returns to regular font color

# Reset
Reset='\033[m'       # Text Reset

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
Black_On_White='\033[1;90;47m'  # Black on White
Blue_On_White='\033[1;90;94;47m'   # Blue on White
Green_On_White='\033[1;90;92;47m'   # Blue on White

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

print_help(){
        echo -e " "
        echo -e "${BIPurple}"'Usage: $(basename $0) [OPTIONS]'"${Reset}"
        echo -e " "
        echo -e  Options:
        echo -e " "
        echo -e "${BIPurple}"'\t --aur-helper=\t'          'Choose an AUR Helper.  Must provide either paru or yay'"${Reset}"
        echo -e '\t -c, --core\t\t'                'Get up the initial system.  This can be skipped if the script has already installed the core utilities.'
        echo -e "${BIPurple}"'\t -e, --extra\t\t'               'Install the extra apps that may not always be necessary.'"${Reset}"
        echo -e '\t -h, --help\t\t'                'Displays this menu'
        echo -e "${BIPurple}"'\t -l, --language-server\t'     'Install language servers for Neovim'"${Reset}"
        echo -e '\t -v, --vpn\t\t'                 'Download the latest Private Internet Access install file, so it is ready to go in ~/Downloads'
        echo -e "${BIPurple}"'\t -w, --work\t\t'                'Install tools only used at work'"${Reset}"
        echo -e '\t -p, --paru\t\t'                'Use paru'"${Reset}"
        echo -e "${BIPurple}"'\t -y, --yay\t\t'                'Use yay'"${Reset}"
        echo  " "
        exit 1
}

install_yay()
{
    echo -e "Installing ${BICyan}yay${Reset} AUR helper..."
    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R jdv:jdv ./yay-git
    cd yay-git
    makepkg -si
    echo -e_done
}

install_paru()
{
    echo -e "Installing ${BICyan}paru${Reset} AUR helper..."
    cd /home/jdv
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    echo -e_done
}

install_aur_helper(){
    # Install AUR Helper
    if [ "$AUR_HELPER" == "yay" ]; then
        install_yay
    elif [ "$AUR_HELPER" == "paru" ]; then
        install_paru
    else
        echo -e "${Red}==> Error:${Reset} Please set AUR_HELPER to either ${BICyan}yay${Reset} or ${BICyan}paru${Reset} at the beginning of the script, and rerun."
        exit 1
    fi
}

install_base_utils()
{
    echo -e "Installing ${BICyan}Base${Reset} ${BICyan}Utilities${Reset} needed to proceed with installation..."

    # Install Reflector
    echo -e "Installing ${BICyan}Reflector${Reset} for updated mirror list..."
    cd ~
    sudo pacman -S --noconfirm "reflector"
    echo -e_done

    # Install Vim
    echo -e "Installing ${BICyan}vim${Reset}..."
    sudo pacman -S --noconfirm "vi" "vim"
    echo -e_done

    # Install git
    echo -e "Installing ${BICyan}git${Reset}..."
    sudo pacman -S --noconfirm "git"
    echo -e_done

    echo -e "Installing ${BICyan}gcc..."${Reset}
    sudo pacman -S --noconfirm "gcc"
    echo -e_done

    echo -e "Installing ${BICyan}make${Reset}..."
    sudo pacman -S --noconfirm "make"
    echo -e_done

    # Install go
    echo -e "Installing ${BICyan}go${Reset} and related utilities..."
    sudo pacman -S --noconfirm "go" "go-tools"
    echo -e_done

    # Install rust and update Rust Toolchain
    echo -e "Installing ${BICyan}rust${Reset} and related utilities..."
    sudo pacman -S --noconfirm "rustup"
    rustup install stable
    rustup default stable
    echo -e_done

    # Install Python3, pip and pynvim
    echo -e "Installing ${BICyan}python${Reset} and related utilities..."
    sudo pacman -S --noconfirm "python" "python-pynvim" "python-pip"
    echo -e_done

    # Install nodejs, yarn and npm
    echo -e "Installing ${BICyan}nodejs${Reset}, ${BICyan}npm${Reset} and ${BICyan}yarn${Reset}..."
    sudo pacman -S --noconfirm "nodejs" "npm" "yarn"
    echo -e_done

    # Misc
    for app in "p7zip" "unrar" "tar" "rsync"
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BICyan}Done installing ${BICyan}${app}${Reset}"

    echo -e "<${BIGreen}Switching CAPS to CTRL using xmodmap ./HOME/jdv/.Xmodmap${Reset}>"
	xmodmap ./HOME/jdv/.Xmodmap

    echo -e "<${BIGreen}Done installing Base Utils.  Proceeding.${Reset}>"
}

install_graphics()
{
    echo -e "${BIPurple}Installing packages needed for graphics (xorg, wm, greeter etc.)${Reset}"

    # Xorg
    echo -e "${BICyan}Installing xorg${Reset}"
    for app in "xorg" "xorg-xinit" "xorg-server"
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BICyan}Done installing ${BICyan}${app}${Reset}"

    # Desktop Environments and Window Managers
    echo -e "${BICyan}Installing Desktop Environments and Window Managers${Reset}"
    for app in "plasma" "qtile" "nitrogen" "picom-ibhagwan-git" 
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
	# Install utility for showing memory, cpu etc in Qtile
	pip install psutil
    echo -e "${BICyan}Done installing ${BICyan}${app}${Reset}"

    # Greeter
    echo -e "${BICyan}Installing Greeter${Reset}"
    # Install Lightdm greeter and webkit2 theme
    echo -e "Setting up Lightdm"
    sudo pacman -S --needed lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
    echo -e "${BICyan}Done installing ${BICyan}${app}${Reset}"

    echo -e "${BIPurple}Done installing packages needed for graphics${Reset}"

}

install_text_editors()
{
    echo -e "${BIPurple}Installing extra text editors.${Reset}"
    for app in "neovim-nightly-bin" "vim-plug-git" "neovim-gtk" "visual-studio-code-bin" 
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BIPurple}Done installing extra text editors${Reset}"
}

install_fonts(){
    # Install fonts
    echo -e "${BIPurple}Installing Core Apps${Reset}"
    for font in "korla-icon-theme-git" "nerd-fonts-iosevka" "termsyn-font" "font-manager" "ttf-fira-code" "ttf-monoid" "nerd-fonts-jetbrains-mono" "ttf-jetbrains-mono" "siji-git" "ttf-font-awesome"" ttf-ionicons" "ttf-liberation" "otf-firamath"
    do
        echo -e "Installing ${BICyan}${font}${Reset}"
        ${AUR_HELPER} -S --noconfirm $font
    done
    echo -e "${BIPurple}Done installing fonts${Reset}"
}

install_core_apps()
{
    echo -e "${BIPurple}Installing Core Apps${Reset}"
    for app in "sudo" "doas" "firefox" "pcmanfm" "openssh" "dmenu2" "w3m" "feh" "i3lock" "betterlockscreen-git" "autoconf" "automake" "pantheon-screenshot" "evince" "mupdf" "okular" "breeze-icons-git" "github-desktop-bin" "xf86-input-wacom" "usbutils" "fx" "vlc" "rofi"
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BIPurple}Done installing Core Apps${Reset}"
}

install_extras()
{
    echo -e "${BIPurple}Installing Optional Apps${Reset}"
    for app in "libreoffice" "gimp" "inkscape" "audacity" "thunderbird" "obs-studio" "discord" "timeshift" "joplin" "brave-bin" "thunar" "thunar-archive-plugin" "xarchiver" "lxappearance" "nerd-fonts-complete-mono-glyphs" "imagemagick" "reflex"
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BIPurple}Done installing Optional Apps${Reset}"
}

install_work()
{
    echo -e "${BIPurple}Installing Work Apps${Reset}"
    for app in "texlive-most" "rclone" "fuse" "pandoc"
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done

    for app in "inkscape-figures"
    do
        echo -e "Installing ${BICyan}${app}${Reset} with pip"
        python3 -m pip install --user --upgrade $app
    done

    echo -e "${BIPurple}Done installing Work Apps${Reset}"
}

install_language_servers(){
    echo -e "${BIPurple}Installing Language Servers${Reset}"
    for app in "bash-language-server" "vscode-html-languageserver-bin" "vscode-json-languageserver" "typescript-language-server" "vls" "yaml-language-server" 
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        sudo npm install -g $app
    done
    
    for app in "jedi-language-server"
    
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        pip install -U $app
    done
    
    for app in "lua-language-server-git" "gopls" "delve"
    
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S $app
    done

    echo -e "${BIPurple}Done installing Language Servers${Reset}"
}

install_audio()
{
    echo -e "${BIPurple}Installing Audio related packages.${Reset}"
    for app in "alsa-utils" "alsa-plugins" "pulseaudio" "pulseaudio-alsa" "moc-alsa" "ncmpcpp"   
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BIPurple}Done installing Audio related packages${Reset}"
}

install_term()
{
    echo -e "${BIPurple}Installing terminal modifications.${Reset}"
    for app in "alacritty" "htop" "gtop" "lolcat" "mlocate" "neofetch" "pfetch" "zsh-git" "oh-my-zsh-git" "asciidoc" "pacman-contrib" "neofetch" "pfetch" "zsh-git" "oh-my-zsh-git" "powerline-fonts" "wget" "xclip" "zsh-completions" "lscolors-git" "fzf" "mlocate" "ripgrep" "exa" "dust" "broot" "scrot"   
    do
        echo -e "Installing ${BICyan}${app}${Reset}"
        ${AUR_HELPER} -S --noconfirm $app
    done
    echo -e "${BIPurple}Done installing terminal modifications${Reset}"
}

install_pia()
{
    echo -e "${BIPurple}Getting PIA Installer.  Run sh pia-linux-XXXXXXXXXXX after script finishes.${Reset}"
    # Check if Downloads exists
    if [ ! -e /home/jdv/Downloads ]; then
        mkdir ~/Downloads
    fi
    cd ~/Downloads
    wget https://www.privateinternetaccess.com/installer/download_installer_linux_beta
    echo -e "${BIPurple}Done${Reset}"
}

echo_done()
{
    echo -e "<${BIGreen}DONE${Reset}>"
}


  while [[ $# -gt 0 ]]; do
    opt="$1"
    shift;
    # current_arg="$1"
    # if [[ "$current_arg" =~ ^-{1,2}.* ]]; then
      # echo -e "WARNING: You may have left an argument blank. Double check your command."
    # fi
    case "$opt" in
      "--aur-helper" )
                 AUR_HELPER="$1"; shift;; #take argument
      "-y"| "--yay" )
                 AUR_HELPER="yay";;     #set to some default value
      "--aur-helper=yay" )
                 AUR_HELPER="yay";;             #take argument
      "-p"| "--paru" )
                 AUR_HELPER="paru";;     #set to some default value
      "--aur-helper=paru" )
                 AUR_HELPER="paru";;             #take argument
      "-c"| "--core" )
                 CORE=true;;     #set to some default value
      "-c"| "--core" )
                 CORE="$1"; shift;; #take argument
      "-c=*"| "--core=*" )
                 CORE="${opt#*=}";;             #take argument
      "-e"| "--extra" )
                 AUR_HELPER="yay"
                 install_extras
                 EXTRA=true;;     #set to some default value
      # "-e"| "--extra" )
                 # EXTRA="$1"; shift;; #take argument
      # "-e=*"| "--extra=*" )
                 # EXTRA="${opt#*=}";;             #take argument
      "-h"| "--help" )
                 print_help;;     #set to some default value
      "-l"| "--language-server" )
                 LANGUAGE_SERVER=true;;     #set to some default value
      "-l"| "--language-server" )
                 LANGUAGE_SERVER="$1"; shift;; #take argument
      "-l=*"| "--language-server=*" )
                 LANGUAGE_SERVER="${opt#*=}";;             #take argument
      "-v"| "--vpn" )
                 PIA=true;;     #set to some default value
      "-v"| "--vpn" )
                 PIA="$1"; shift;; #take argument
      "-v=*"| "--vpn=*" )
                 PIA="${opt#*=}";;             #take argument
      "-w"| "--work" )
                 WORK=true;;     #set to some default value
      "-w"| "--work" )
                 WORK="$1"; shift;; #take argument
      "-w=*"| "--work=*" )
                 WORK="${opt#*=}";;             #take argument
      *                         ) echo -e "ERROR: Invalid option: \""$opt"\"" >&2
                                  exit 1;;
    esac
  done

# if [ ! "$AUR_HELPER" = "yay" ] && [ ! "$AUR_HELPER" = "paru" ]; then
  # echo -e "ERROR: Option -a requires either yay or paru" >&2
  # exit 1
# fi


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



