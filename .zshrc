# Get operating system information.
source /etc/os-release

# oh-my-zsh installation path.
if [[ $ID == "arch" ]]
then
    ZSH=/usr/share/oh-my-zsh/
else
    ZSH=/home/$USER/.oh-my-zsh/
fi

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="darkblood"

# oh-my-zsh plugins.
plugins=()

# Make required files/directories if they do not exist.
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
if [[ ! -f ~/.path ]]; then
  touch ~/.path
fi
if [[ ! -f ~/.localrc ]]; then
  touch ~/.localrc
fi

# Sourcing oh-my-zsh, functions, and plugins.
source $ZSH/oh-my-zsh.sh
source ~/.zshfunctions
source ~/.path
source ~/.localrc

# alises.
alias ipconfig="ip addr"
alias iwconfig="ip addr"
alias which_window="xprop"
alias ls="exa"
alias l="exa --long"
alias la="exa --long -a"
alias img="viu"
alias hex="hexyl"
alias cat="bat --style=full --pager=never"
alias bat="bat --pager=never -p"
alias calc="eva"
alias cp="xcp"

# Commands to run at startup.
neofetch
echo "Updating dotfiles..."
( cd ~ ; git pull )
