#! /bin/bash

source ~/.dotfiles/helpers.sh

h_validate_num_args --num=1 "$@"
h_validate_package_manager "$1"

h_install_package "$1" "tmux"

if [[ -d ~/.tmux/plugins/tpm/ ]]
then
  h_echo --mode=noop "tpm already installed"
else
  h_echo --mode=doing "cloning tpm"
  git clone "https://github.com/tmux-plugins/tpm" "~/.tmux/plugins/tpm/"
fi

h_echo --mode=doing "installing tpm plugins"
~/.tmux/plugins/tpm/bin/install_plugins
