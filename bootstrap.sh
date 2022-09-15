#!/bin/bash
function coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

if [ "$(uname)" != "Darwin" ]; then
  coloredEcho "sorry! this script only supports macos" red
  exit 1
fi

if [ "$(command -v brew)" == "" ]; then
    coloredEcho "installing hombrew" green
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  coloredEcho "homebrew already installed" blue
fi

if [ "$(brew ls --versions tmux)" == "" ]; then
  coloredEcho "installing tmux" green
  brew install tmux
else
  coloredEcho "tmux already installed" blue
fi

tpm_directory="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$tpm_directory" ]; then
  coloredEcho "installing tpm" green
  git clone https://github.com/tmux-plugins/tpm $tpm_directory
  "$tpm_directory/bin/install_plugins"
else
  coloredEcho "packer already installed" blue
fi
