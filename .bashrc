#!/bin/bash
#------------------------------------------////
# Lapbox ~/.bashrc file
# Last Modified 20 January 2009
# Running on Debian GNU/Linux - Lenny
#------------------------------------------////
#------------------------------------------////
# Colors:
#------------------------------------------////
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

#------------------------------------------////
# Proxy:
#------------------------------------------////
#http_proxy=http://127.0.0.1:8118/
#HTTP_PROXY=$http_proxy
#export http_proxy HTTP_PROXY

#------------------------------------------////
# Aliases:
#------------------------------------------////
## make ls list by size
##alias ls='du -s */* | sort -n'
alias findbig='find . -type f -exec ls -s {} \; | sort -n -r | head -5'
alias ls='ls -aF --color=always'
alias la='ls -Al'
alias lx='ls -lXB'
alias lk='ls -lSr'
alias lc='ls -lcr'
alias lu='ls -lur'
alias lr='ls -lR'
alias lt='ls -ltr'
alias lm='ls -al |more'
#alias rm='rm -i'
#------------------------------------------////
# Functions and Scripts:
#------------------------------------------////
localnet ()
{
/sbin/ifconfig | awk /'inet addr/ {print $2}' 
echo ""
/sbin/ifconfig | awk /'Bcast/ {print $3}' 
echo ""
}
myip ()
{
lynx -dump -hiddenlinks=ignore -nolist [url]http://checkip.dyndns.org:8245/[/url] | grep "Current IP Address" | cut -d":" -f2 | cut -d" " -f2
}
upinfo ()
{
echo -ne "${green}$HOSTNAME ${red}uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}
cd() 
{
  if [ -n "$1" ]; then
    builtin cd "$@" && ls
  else
    builtin cd ~ && ls
  fi
}

extract()
{
if [ -f "$1" ] ; then
case "$1" in
*.tar.bz2) tar xjf "$1" ;;
*.tar.gz) tar xzf "$1" ;;
*.tar.Z) tar xzf "$1" ;;
*.bz2) bunzip2 "$1" ;;
*.rar) unrar x "$1" ;;
*.gz) gunzip "$1" ;;
*.jar) unzip "$1" ;;
*.tar) tar xf "$1" ;;
*.tbz2) tar xjf "$1" ;;
*.tgz) tar xzf "$1" ;;
*.zip) unzip "$1" ;;
*.Z) uncompress "$1" ;;
*) echo "'$1' cannot be extracted." ;;
esac
else
echo "'$1' is not a file."
fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib/ccache/bin/:/usr/lib/colorgcc/bin"
export PATH
export CCACHE_PATH="/usr/bin"
export PS1='\[\033[1;33m\]\u \[\033[1;36m\]\w\n\[\033[1;31m\]> \[\033[00m\]'
#PS1= '{\w} $ > '
#PS1="{\d \t \u@\h:\w } $ "

#------------------------------------------////
# System Information:
#------------------------------------------////
clear
#echo -e "${white}";figlet "ArchLinux";
#echo -ne "${white}Today is:\t\t${white}" `date`; echo ""
#echo -e "${white}Kernel Information: \t${white}" `uname -smr`
#echo -ne "${white}";upinfo;echo ""
#echo -e "${white}"; cal -3
#export LANG=en_US.UTF-8
#export http_proxy=http://bolu13ip39:mos@10.3.3.126:6666/
