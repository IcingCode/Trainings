# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="agnoster"

# Set History options
HIST_IGNORE_DUPS="true"
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

# Plugins to load
plugins=(
git
docker
docker-compose
zsh-autosuggestions
rsync
ansible
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias myip="curl ipinfo.io/ip; echo"
alias cp="cp -i"                         
alias df='df -h'                          
alias free='free -mh'                     
alias np='nano -w PKGBUILD'
alias more=less
alias ll="ls -alrth --color=auto"
alias ls="ls -lrth --color=auto"
alias shred="shred -zvu -n 5"
alias vi=vim
alias wget='wget -c'
alias reboot="sudo /sbin/reboot"
alias poweroff="sudo /sbin/poweroff"
alias shutdown="sudo /sbin/shutdown"
alias mkdir="mkdir -pv"
alias lsblk="lsblk -o +LABEL"
# Nmap aliases
alias qmapz='sudo nmap -sV -O -A -sC -sS $1'
alias pmapz='nmap -p- -Pn -sV $1'
alias secmapz='nmap -Pn --script ssl-enum-ciphers -p 443 $1'
alias htmmapz='nmap -Pn --script http-methods -p 443 $1'
alias hthmapz='nmap -sV --script=http-headers $1'

