#! /bin/bash

source ~/.dotfiles/helpers.sh

h_validate_num_args --num=1 "$@"
h_validate_package_manager $1

h_install_package $1 tmux

if [[ -d ~/.tmux/plugins/tpm/ ]]
then
  h_cecho --noop "tpm already installed"
else
  h_cecho --doing "cloning tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
fi

h_cecho --doing "installing tpm plugins"
~/.tmux/plugins/tpm/bin/install_plugins
