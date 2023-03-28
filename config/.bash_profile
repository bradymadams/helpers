#! /bin/bash

parse_git_branch() {
    GITBRANCHES=$(git branch -vv 2> /dev/null)
    GITBRANCH=$(echo "${GITBRANCHES}" | sed -e '/^[^*]/d')
    echo "${GITBRANCH}" | sed -e 's/* \(\S*\)\s*\([a-z0-9]*\)\s\(.*\)/ (\1) \[\2\] \3/'
}

export PS1="\u@\h \[\033[36m\]\W\[\033[00m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "

if [ -n "${VIRTUAL_ENV}" ] && ! type deactivate >/dev/null 2>&1; then
    . "${VIRTUAL_ENV}/bin/activate"
fi

