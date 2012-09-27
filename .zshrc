# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
setopt appendhistory autocd nomatch notify
unsetopt beep extendedglob
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

#HOSTNAME = Archlinux666
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dedy/.zshrc'



PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib/ccache/bin/:/usr/lib/colorgcc/bin"
export PATh
autoload -Uz compinit
compinit
autoload -U promptinit
promptinit 
autoload -U colors && colors

PROMPT="%{$fg[yellow]%}%B%n%b %B%{$fg[white]%}%#%b %{$fg[yellow]%}%B%U%~%u%b%{$fg[red]%}%B > %b"
#PROMPT="%{$fg[black]%}%B%n%b %B%{$fg[black]%}%#%b %{$fg[black]%}%B%U%~%u%b%{$fg[black]%}%B > %b"
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
alias sch='cat /sys/block/sda/queue/scheduler'
alias cek='cat /sys/devices/system/cpu/cpufreq/ondemand/up_threshold'
alias officetes='strace -fF -o out.txt -e open soffice --writer'
alias dota='wine ~/Warcraft\ III/war3.exe -opengl'
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

upinfo ()
{
echo -ne "$fg[white]uptime is $fg[yellow] \t\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
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

setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE 
export LC_ALL=id_ID.UTF-8
export LANG=id_ID.UTF-8
autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload  zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31' 

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'


#print -Pc '%B`figlet "ArchLinux"%b`'
#echo -e "$bold_color $fg[yellow]";figlet "ArchLinux";
#echo -n "$fg[white]Today is:\t\t$fg[yellow]" `date`; echo ""
#echo -e "$fg[white]Kernel Information: \t$fg[yellow]" `uname -smr`
#echo -ne "$fg[white]";upinfo;echo "      "
#echo -e "$fg[white]"; cal -3
# End of lines added by compinstall
