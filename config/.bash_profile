#! /bin/bash

export HISTCONTROL=ignoredups:erasedups
export EDITOR=vim

alias python="python3"
alias vim="nvim"
alias vimjq="vim -c \%\!jq"
alias vimf="vim \$(fzf)"
alias ccat="pygmentize -g -P style=dracula"
alias ls="ls --color=always --group-directories-first"

ltree() {
    tree -I '*.pyc|__pycache__' -D $*
}

parse_git_branch() {
    GITBRANCHES=$(git branch -vv 2> /dev/null)
    GITBRANCH=$(echo "${GITBRANCHES}" | sed -e '/^[^*]/d')
    echo "${GITBRANCH}" | sed -e 's/* \(\S*\)\s*\([a-z0-9]*\)\s\(.*\)/(\1) \[\2\] \3/'
}

get_aws_profile() {
    if [ "${AWS_PROFILE}" != "" ] && [ "${AWS_PROFILE@a}" == "x" ]; then
        echo "[${AWS_PROFILE}] "
    fi
}

set_prompt() {
    export PS1="\[\033[90m\]\$(parse_git_branch)\[\033[00m\]\n\[\033[31m\]\$(get_aws_profile)\[\033[00m\]\[\033[36m\]\w\[\033[00m\] $ "
}

# Auto-activate nearest .venv once at shell startup
auto_activate_venv() {
    local dir=$(pwd)
    local venv_dir=""

    # If VIRTUAL_ENV is already set, treat as override
    if [ -n "$VIRTUAL_ENV" ] && [ -d "$VIRTUAL_ENV" ]; then
        # Only source if it's not already active in this shell
        if [ "$VIRTUAL_ENV" != "$(pwd)" ]; then
            source "$VIRTUAL_ENV/bin/activate"
        fi
        return
    fi

    # Search upward for .venv directory, stopping at $HOME
    while [ "$dir" != "$HOME" ] && [ "$dir" != "/" ]; do
        if [ -d "$dir/.venv" ]; then
            venv_dir="$dir/.venv"
            break
        fi
        dir=$(dirname "$dir")
    done

    # Activate if found
    if [ -n "$venv_dir" ]; then
        source "$venv_dir/bin/activate"
    fi
}

gitview() {
    if [ $# -lt 2 ]; then
        echo "Usage: gitview <branch-or-commit> <path/to/file>"
        return 1
    fi

    local ref=$1
    local filepath=$2
    local filename=$(basename "$filepath")
    local ext="${filename##*.}"
    local tmpfile="/tmp/gitview-$filename"

    git show "$ref:$filepath" > "$tmpfile" && vim "$tmpfile"
}

# If interactive shell, set it up
case $- in
    *i*)
        set -o vi
        set_prompt
        auto_activate_venv
        ;;
esac

