# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Sets up colors properly
export TERM="xterm-256color"

# Set name of the theme to load
ZSH_THEME="agnoster"

# History config
HISTCONTROL=erasedups:ignorespace:ignoredups
HIST_IGNORE_DUPS="true"
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

# Plugins to load
plugins=(
ansible
git
docker
docker-compose
zsh-autosuggestions
rsync
ansible
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias fdisk="sudo fdisk"
alias lsblk="lsblk -o +LABEL"
alias myip="curl https://ip.me; echo"
alias cp="cp -i"
alias df='df -h'
alias np='nano -w PKGBUILD'
alias more=less
alias ll="ls -alrth"
alias vi=vim
alias shred="shred -zvu -n 5"
alias pacman="sudo pacman"
alias rename="perl-rename"
alias wget='wget -c'
alias reboot="sudo /sbin/reboot"
alias poweroff="sudo /sbin/poweroff"
alias shutdown="sudo /sbin/shutdown"
alias mkdir="mkdir -pv"
alias findbigfiles='find . -xdev -size +1000000c -type f -exec du -m {} + 2>/dev/null | sort -n | tail -20 | while IFS= read -r line; do ls -l --block-size=M --color=auto -a "$(echo "$line" | cut -f2-)"; done'
alias rename_spaces="find . -type f -exec perl-rename -v 's/ /_/g' '{}' \;"
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"
# Nmap aliases
# Quick scan with service version detection, OS detection, and aggressive scanning
alias nmap_quickscan='sudo nmap -sV -O -A -sC -sS'
# Fullnmap_ TCP port scan with service version detection
alias nmap_fullportscan='nmap -p- -Pn -sV'
# Scan for SSL/TLS ciphers on port 443
alias nmap_sslcipherscan='nmap -Pn --script ssl-enum-ciphers -p 443'
# Scan for supported HTTP methods on port 443
alias nmap_httpmethods443scan='nmap -Pn --script http-methods -p 443'
alias nmap_httpmethods80scan='nmap -Pn --script http-methods -p 80'
# Scan HTTP headers
alias nmap_http_headers_scan='nmap -sV --script http-headers'
# Full TCP port scan with service version detection
alias nmap_fullscan='nmap -p- -sV'
# Fast scan with common ports
alias nmap_fastscan='nmap -F'
# UDP scan with service version detection
alias nmap_udpscan='sudo nmap -sU -sV'
# Scan for vulnerabilities using default scripts
alias nmap_vulnscan='nmap --script vuln'
# Detect live hosts within a subnet
alias nmap_livescan='nmap -sn'
# Scan a range of IP addresses for open ports and service versions
alias nmap_rangescan='nmap -p- -sV $1-$2'
# Nikto scan
nmap_nikto-http() {
    nmap -p80 "$1" -oG - | nikto -h -
}
nmap_nikto-https() {
    nmap -p80,443 "$1" -oG - | nikto -h -
}
# Netbios
alias nmap_netbios='nmap -sV -v -p 139,445'
alias nmap_netbios_name='nmap -sU --script nbstat -p 137'
alias nmap_netbios-ms08-067='nmap --script smb-vuln-ms08-067 -p 445 --script-args=unsafe=1'
# Output formats
alias nmap_grep='nmap -sV -p 139,445 -oG nmap_scan_$(date +%d%m%Y-%H%M%S).txt'
nmap_html_func() {
    if [ -z "$1" ]; then
        echo "Usage: nmap_html <target> [output_file.html]"
        return 1
    fi
    local target=$1
    local output_file=${2:-file.html}
    sudo nmap -sS -sV -T5 -oX - "$target" | xsltproc -o "$output_file" -
}
alias nmap_html=nmap_html_func
# Basic scans
alias nmap_verbose='nmap -v -sS -A -T4'
alias nmap_version='nmap -v -sV -O -sS -T5'

# Usage: verify_csr <csrfile>
verify_csr() {
    local csrfile=$1
    if [[ -z "$csrfile" ]]; then
        echo "Usage: verify_csr <csrfile>"
        return 1
    fi
    openssl req -text -noout -verify -in "$csrfile"
}
