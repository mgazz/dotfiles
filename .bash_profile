#!/bin/bash

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
#for file in ~/.{bash_prompt,aliases,functions,path,dockerfunc,extra,exports}; do
for file in ~/.{bash_prompt,aliases,dockerfunc,extra,exports,bashrc}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file

export GPG_TTY=$(tty)
