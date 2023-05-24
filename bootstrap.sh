#!/bin/bash
function cecho(){
    tput setaf $2;
    echo $1;
    tput sgr0;
}

if [ "$(uname)" != "Darwin" ]; then
  cecho "sorry! this script only supports macos" 1
  exit 1
fi

if [ "$(command -v brew)" == "" ]; then
    cecho "installing hombrew" 2
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  cecho "homebrew already installed" 4
fi

if [ "$(brew ls --versions tmux)" == "" ]; then
  cecho "installing tmux" 2
  brew install tmux
else
  cecho "tmux already installed" 4
fi

tpm_directory="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$tpm_directory" ]; then
  cecho "installing tpm" 2
  git clone https://github.com/tmux-plugins/tpm $tpm_directory
else
  cecho "tpm already installed" 4
fi

cecho "installing tpm plugins" 2
"$tpm_directory/bin/install_plugins"
