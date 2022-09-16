#!/bin/bash
function coloredEcho(){
    tput setaf $2;
    echo $1;
    tput sgr0;
}

if [ "$(uname)" != "Darwin" ]; then
  coloredEcho "sorry! this script only supports macos" 1
  exit 1
fi

if [ "$(command -v brew)" == "" ]; then
    coloredEcho "installing hombrew" 2
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  coloredEcho "homebrew already installed" 4
fi

if [ "$(brew ls --versions tmux)" == "" ]; then
  coloredEcho "installing tmux" 2
  brew install tmux
else
  coloredEcho "tmux already installed" 4
fi

tpm_directory="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$tpm_directory" ]; then
  coloredEcho "installing tpm" 2
  git clone https://github.com/tmux-plugins/tpm $tpm_directory
  "$tpm_directory/bin/install_plugins"
else
  coloredEcho "packer already installed" 4
fi
