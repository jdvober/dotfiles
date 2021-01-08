# Auto-start of programs

# Rainbow
# neofetch | lolcat
# Non-rainbow
neofetch
piactl connect


# Enabling ls colors.  See trapd00r/LS_COLORS on github.
. "/usr/share/LS_COLORS/dircolors.sh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#Keychain
eval $(keychain --eval --quiet id_rsa_github)
# zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_github

# Path to your oh-my-zsh installation.
export ZSH="/home/jdv/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"
#
# If using Powerline, use this, otherwise comment out and use ZSH_THEME for ohmyzsh
# powerline-daemon -q
# . /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
#
# If using powerline-shell or powerline-shell-git
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(ssh-agent git golang history-substring-search colored-man-pages)
plugins=(git golang history-substring-search colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set prompt 1 style
# PS1="$"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Remove duplicate entries in History
export HISTCONTROL=ignoreboth

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
#
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

setopt COMPLETE_ALIASES

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# https://blog.lftechnology.com/command-line-productivity-with-zsh-aliases-28b7cebfdff9
# Normal aliases
alias cls="clear && pfetch | lolcat"
# alias ls="ls -A --color=auto --file-type --group-directories-first"
alias ls="pwd && exa --grid --long --all --group-directories-first --sort=ext"
alias tree="pwd && exa --tree --level=3 ../. --long --all"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias grep="grep --color=auto"
alias :q="exit"
alias :wq="exit"

# Program aliases
alias g="git"
alias gs="git status"
# eval $(thefuck --alias --enable-experimental-instant-mode)
# alias f="fuck --yeah"

# Location shortcuts
alias ..="cd .."
alias godir="cd ~/go/src/github.com/jdvober && ls"
alias dotfiles="cd ~/github.com/jdvober/dotfiles && ls"
alias -g GODIR="~/go/src/github.com/jdvober"
alias -g DOTS="~/github.com/jdvober/dotfiles/.config"
alias -g DOTFILES="~/github.com/jdvober/dotfiles/.config"

# Config shortcuts
alias -g ZSHRC="~/.zshrc"
alias -g ZSH="~/.zshrc"
alias -g QTILE="~/github.com/jdvober/dotfiles/.config/qtile/config.py"
alias -g INSTALLSH="~/github.com/jdvober/dotfiles/install-core-apps.sh"
alias -g POWERLINE="~/github.com/jdvober/dotfiles/.config/powerline-shell/config.json"
alias -g LOCK="~/github.com/jdvober/dotfiles/.config/betterlockscreenrc"

# Power and User Management
alias restart="sudo shutdown -r now"
alias switchuser="dm-tool switch-to-greeter"

# Git all-in-one
gpush() {
    git add . &&
    git commit -m $1 &&
    git push
    git push
}

source /home/jdv/.config/broot/launcher/bash/br
