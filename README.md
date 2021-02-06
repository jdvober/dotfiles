# Run install-apps.sh to set up the apps of a new install.
    Flags:

    -h
    Displays the various flags

    -c
    Set up the initial system.  This can be skipped if the script has already installed the core utilities.

    -a yay | paru
    Chooses and AUR Helper

    -e
    Install the "extra" apps that may not always be necessary.

    -w
    Install tools only used at work

    -l
    Install language servers for Neovim

    -p
    Download the latest Private Internet Access install file, so it is ready to go in ~/Downloads

# Symbolic Linking
### Automatic Linking
From this directory:
    go run linkFiles.go

### Manual Linking
    $ ln -s {source-dir-name} {symbolic-dir-name}
    ex: ln -s ~/github.com/jdvober/dotfiles/.config/alacritty ~/.config/

Most of these files should go in ~/.config/
###
    ~/.config/i3/config
    ~/.config/nvim/
    ~/.config/polybar

Others go in $HOME
###
    ~/.zshrc

