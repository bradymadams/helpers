#! /bin/bash

SCRIPT=$(realpath ${0})
CFGDIR=$(dirname ${SCRIPT})
TGTDIR=${1:-${HOME}}
XDGCFG=${XDG_CONFIG_HOME:-${HOME}/.config}

ln -sf ${CFGDIR}/.inputrc ${TGTDIR}/.inputrc
ln -sf ${CFGDIR}/.tmux.conf ${TGTDIR}/.tmux.conf
ln -sf ${CFGDIR}/.vimrc ${TGTDIR}/.vimrc
ln -sf ${CFGDIR}/.wezterm.lua ${TGTDIR}/.wezterm.lua
ln -sf ${CFGDIR}/nvim ${XDGCFG}

mkdir -p ${XDGCFG}/i3
ln -sf ${CFGDIR}/.i3config ${XDGCFG}/i3/config

mkdir -p ${XDGCFG}/i3status
ln -sf ${CFGDIR}/.i3status ${XDGCFG}/i3status/config

mkdir -p ${XDGCFG}/qutebrowser
ln -sf ${CFGDIR}/.qutebrowser.py ${XDGCFG}/qutebrowser/config.py

# This file needs to be created manually
ln -sf ${CFGDIR}/.local/.devenv.lua ${TGTDIR}/.devenv.lua

git config --global --add alias.lg "log --oneline"
git config --global --add core.editor vim
git config --global --add core.excludesFile ${CFGDIR}/.gitignore.global
git config --global --add pull.rebase true
