# ~/.bashrc: executed by bash(1) for non-login shells.

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# history settings
histcontrol=ignoreboth
shopt -s histappend
histsize=1000
histfilesize=2000

# check window size after each command
shopt -s checkwinsize

# enable '**' pattern for pathname expansion
shopt -s globstar

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(shell=/bin/sh lesspipe)"

# set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$term" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# prompt settings
if [ "$color_prompt" = yes ]; then
    ps1="→ "
else
    ps1="→ "
fi
unset color_prompt force_color_prompt

# set xterm title to user@host:dir
case "$term" in
xterm*|rxvt*)
    ps1="→"
    ;;
*)
    ;;
esac

# enable color support of ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored gcc warnings and errors
export gcc_colors='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# more ls aliases
alias ll='ls -alf'
alias la='ls -a'
alias l='ls -cf'
alias py='python3'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ../..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias wifikey="sudo grep -r '^psk=' /etc/networkmanager/system-connections/"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias whereami='pwd'

# source .bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# export paths
export path=$path:/usr/local/go/bin
export path=$path:/opt/nvim
export path="$path:/usr/lib/postgresql/14/bin"
export path=$path:/usr/local/go/
export db_dsn='connString for greenlight database'
# source kubectl completion
source <(kubectl completion bash)

# nvm settings
export nvm_dir="$home/.nvm"
[ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"
[ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion"
source /etc/profile.d/bash_completion.sh

# tmux alias
alias tmux="tmux -u"
alias vim="nvim"

# git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | grep '*' | sed 's/* //'
}

# get the name of parent directory till one level
parent_directory(){
    basename "$(pwd)"
}

# function to get the exit status of the last command
get_exit_status() {
    local status=$?
    if [ $status -eq 0 ]; then
        echo -e "\[\e[32m\]✔\[\e[m\]"
    else
        echo -e "\[\e[31m\]✘($status)\[\e[m\]"
    fi
}

# improved prompt with git branch
PS1='→ \[\e[32m\]$(parent_directory)\[\e[m\] $(if [ -n "$(parse_git_branch)" ]; then echo "\[\e[34m\]git(\[\e[38;5;214m\]$(parse_git_branch)\[\e[34m\])\[\e[m\] "; fi)⚡ '
