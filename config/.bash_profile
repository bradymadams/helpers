#! /bin/bash

alias python="python3"
alias vimjq="vim -c \%\!jq"
alias ccat="pygmentize -g"
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

#export PS1="\u@\h \[\033[36m\]\W\[\033[00m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "
export PS1="\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n\[\033[31m\]\$(get_aws_profile)\[\033[00m\]\[\033[36m\]\w\[\033[00m\] $ "

if [ -n "${VIRTUAL_ENV}" ] && ! type deactivate >/dev/null 2>&1; then
    . "${VIRTUAL_ENV}/bin/activate"
fi

set -o vi

