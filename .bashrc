# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command
shopt -s checkwinsize

# Enable '**' pattern for pathname expansion
shopt -s globstar

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
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

# Prompt settings
if [ "$color_prompt" = yes ]; then
    PS1="→ "
else
    PS1="→ "
fi
unset color_prompt force_color_prompt

# Set xterm title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="→"
    ;;
*)
    ;;
esac

# Enable color support of ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# More ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias py='python3'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias wifikey="sudo grep -r '^psk=' /etc/NetworkManager/system-connections/"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias whereami='pwd'

# Source .bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Additional completion for common tools
complete -o default -o nospace -F _git git

# Export paths
export PATH="$PATH:/usr/local/go/bin:/usr/lib/postgresql/14/bin:/usr/local/go/:/home/vivekup3424/.local/bin"
export JAVA_HOME=/usr/java/jre1.8.0_421
export PATH=$JAVA_HOME/bin:$PATH

# NVM settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
source /etc/profile.d/bash_completion.sh

# Tmux alias
alias tmux="tmux -u"
alias vim="nvim"
alias obsidian="/usr/bin/Obsidian-1.7.4.AppImage"

# Git branch in prompt
# parse_git_branch() {
#     git branch 2> /dev/null | grep '*' | sed 's/* //'
# }

# Get the name of parent directory till one level
parent_directory(){
    basename "$(pwd)"
}

# Function to get the exit status of the last command
get_exit_status() {
    local status=$?
    if [ $status -eq 0 ]; then
        echo -e "\[\e32m\✔\[\e[m\]]"
    else
        echo -e "\[\e[31m\]✘($status)\[\e[m\]]"
    fi
}

tsession(){
    ~/tmux-sessionizer
}

p() {
    git add . && git commit -m "$1" && git push
}

oneline(){
    git log --oneline
}
book(){
    ~/book
}
find_open(){
    ~/find_open
}
# Function to get git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Main prompt
PS1='$(if [ $? -eq 0 ]; then
    echo "\[\e[32m\]✓\[\e[m\] ";
else
    echo "\[\e[31m\]✘\[\e[m\] ";
fi)\
\[\e[32m\]$(parent_directory)\[\e[m\] \
$(if [ -n "$(parse_git_branch)" ]; then
    echo "\[\e[34m\]git(\[\e[38;5;214m\]$(parse_git_branch)\[\e[34m\])\[\e[m\] ";
fi)\
⚡ '

# Evaluate brew environment
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
