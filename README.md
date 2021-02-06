# Run install-apps.sh to set up the apps of a new install.
    Options:

    --yay
    Use yay as your AUR helper

    --paru
    Use paru as your AUR helper

    --extras
    Install the "extra" apps that may not always be necessary.

    --work
    Install tools only used at work

    --language-servers
    Install language servers for Neovim

    --pia
    Download the latest Private Internet Access install file, so it is ready to go in ~/Downloads

# Symbolic Linking
### Automatic Linking
    go run linkFiles.go from this directory

### Manual Linking
    $ ln -s {source-dir-name} {symbolic-dir-name}
    ex: ln -s ~/github.com/jdvober/dotfiles/.config/alacritty ~/.config/

Most of these files should go in ~/.config/
    ~/.config/i3/config
    ~/.config/nvim/
    ~/.config/polybar

Others go in $HOME
    ~/.zshrc

