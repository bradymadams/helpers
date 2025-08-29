#! /bin/bash

SCRIPT=$(realpath ${0})
CFGDIR=$(dirname ${SCRIPT})
TGTDIR=${1:-${HOME}}
XDGCFG=${XDG_CONFIG_HOME:-${HOME}/.config}

ln -sf ${CFGDIR}/.vimrc.HOME ${TGTDIR}/.vimrc
ln -sf ${CFGDIR}/.tmux.conf ${TGTDIR}/.tmux.conf
ln -sf ${CFGDIR}/.inputrc ${TGTDIR}/.inputrc
ln -sf ${CFGDIR}/nvim ${XDGCFG}

mkdir -p ${XDGCFG}/i3
ln -sf ${CFGDIR}/.i3config ${XDGCFG}/i3/config

git config --global --add alias.lg "log --oneline"
git config --global --add core.editor vim
git config --global --add core.excludesFile ${CFGDIR}/.gitignore.global
git config --global --add pull.rebase true
