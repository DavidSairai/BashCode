# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#cd bin
alias bin='cd /bin/'

#edit curl text file
alias url='sudo nano /bin/urlstatus.txt'
alias site='sudo ./bin/curl.sh'
alias ls='ls -a'
alias script='sudo nano .bashrc'

# install  colordiff package :)
alias diff='colordiff'
# handy short cuts #
alias h='history'
alias j='jobs -l'
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
## distrp specifc RHEL/CentOS ##
alias aptupdate='sudo apt update -y  && sudo apt upgrade -y'
alias yumupdate='sudo yum update -y  && sudo yum upgrade -y'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

#wget verbose
alias wg='wget -v'

#curl
alias cl='curl -IL'
alias clk='curl -K'
alias clp='curl --proxy '

#clear screen
alias c='clear'
