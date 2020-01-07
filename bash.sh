# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# make sure bc start with standard math library
alias bc='bc -l'
# protect cp, mv, rm command with confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Make sure dnstop only shows eth1 stats
alias dnstop='dnstop -l 5  eth1'

# Make grep pretty
alias grep='grep --color'

# ls command shortcuts
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'

# Centos/RHEL server update
alias update='yum update'
alias updatey='yum -y update'
# vi is vim
alias vi='vim'

# Make sure vnstat use eth1 by default
alias vnstat='vnstat -i eth1'

# Make curl
alias cl='curl -IL'
alias curlp='curl --proxy '

# Date and Time Aliases
alias d='date +%F'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'

# Others
alias cls='clear'
