# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



####
## Graphic shiiiiit
####

case "$TERM" in
        xterm) export TERM=screen-256color;;
        xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
		if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
		else
            color_prompt=
		fi
fi

current_branch(){
	branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    [[ -n "$branch" ]] && echo "b:$branch"
}

# if setup environment 
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bash_profile" ]; then
	. "$HOME/.bash_profile"
    fi
fi


function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "venv:$venv"
}

short_hostname=""
user_color=""
hostname_color=""


if [ "$color_prompt" = yes ]; then

	if [[ "$USER" = mgazz ]]; then
		user_color=200 #purple
	elif [[ "$USER" = cloud ]]; then
		user_color=123 #light-blue
	elif [[ "$USER" = alix ]]; then
		user_color=47 #light-green
	elif [[ "$USER" = michele ]]; then
		user_color=47 #light-green
	else
		user_color=226 #yellow
	fi

	if [[ `hostname` = base ]]; then
		hostname_color=91 #violet
	elif [[ `hostname` = 'oc2124865733.ibm.com' ]]; then
		hostname_color=47 #light-green
	elif [[ `hostname` = "michele-ThinkPad-T420" ]]; then
		#hostname_color=161 #violet
		hostname_color=91 #violet
	elif [[ `hostname` = cloud ]]; then
		hostname_color=123 #light-blue
	elif [[ `hostname` = ubuntu ]]; then
		hostname_color=208 #orange
	elif [[ `hostname` = alix ]]; then
		hostname_color=47 #light-green
	elif [[ `hostname` = "mgazz-vaio" ]]; then
		hostname_color=123 #light-green
	elif [[ `hostname` = "raspberrypi" ]]; then
		hostname_color=161 #light-green
	else
		hostname_color=226 #yellow
	fi
	linec="36"
	cc="247"
	dirc="231"
	arrowc="244"
	#textc="229"
	textc="231"

	
	PS1=''
    PS1=$PS1'\[$(tput bold)\]'
    PS1=$PS1'\[$(tput setaf '$linec')\]┌─['
    PS1=$PS1'\[$(tput setaf '$user_color')\]\u'
	PS1=$PS1'\[$(tput setaf '$arrowc')\]@'
    PS1=$PS1'\[$(tput setaf '$hostname_color')\]\h'
    PS1=$PS1'\[$(tput setaf '$linec')\]❯'
    PS1=$PS1'\[$(tput setaf '208')\]$(current_branch)'
    PS1=$PS1'\[$(tput setaf '$linec')\]❯'
    PS1=$PS1'\[$(tput setaf '208')\]$(virtualenv_info)'
	##PS1=$PS1'\[$(tput setaf '$linec')\]❯'
	##PS1=$PS1'\[$(tput setaf '81')\]$(__docker-machine-ps1)'
	##PS1=$PS1'[\W$(__docker-machine-ps1)]'
	##PS1=$PS1'\[$(tput sgr0)\]'
    PS1=$PS1'\[$(tput setaf '$linec')\]❯'
    PS1=$PS1'\[$(tput setaf '$dirc')\]\w'
    PS1=$PS1'\[$(tput setaf '$linec')\]❯ \n└'
    #PS1=$PS1'\[$(tput setaf '$linec')\]❯'
	#PS1=$PS1'\[$(tput setaf '$linec')\]❯'
	PS1=$PS1'\[$(tput setaf '$arrowc')\]❯'
	PS1=$PS1'\[$(tput setaf '$textc')\]'
else
	#PS1='┌────[\u@\h]────[\t]────┐ \n└─❭❭❭[${PWD}] \$ '
    echo "$color_prompt"
    PS1='$'
fi

unset color_prompt force_color_prompt


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # shellcheck disable=SC2015
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#--------------------------------------

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        # shellcheck source=/dev/null
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        # shellcheck source=/dev/null
        . /etc/bash_completion
    fi
fi

#for file in /etc/bash_completion.d/* ; do
    ## shellcheck source=/dev/null
    #source "$file"
#done

#if [[ -f "${HOME}/.bash_profile" ]]; then
#    # shellcheck source=/dev/null
#    source "${HOME}/.bash_profile"
#fi

if [[ -f "${HOME}/.Xmodmap" && -x "$(command -v xmodmap)" ]]; then
    xmodmap ~/.Xmodmap
fi

# added by travis gem
[ -f /home/mgazz/.travis/travis.sh ] && source /home/mgazz/.travis/travis.sh

