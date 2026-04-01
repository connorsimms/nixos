#!/bin/zsh

export DOTFILES="$HOME/.dotfiles"

brew bundle install --file="$DOTFILES/macos/Brewfile"

zsh "$DOTFILES/macos/link.sh"

if [ ! -e "~/.config/zsh/.zprofile" ]; then
    touch "~/.config/zsh/.zprofile"
fi

if ! grep -q "shellenv" ~/.config/zsh/.zprofile; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.config/zsh/.zprofile
fi

defaults write com.apple.dock persistent-apps -array

defaults write com.apple.dock autohide -bool true

killall Dock

defaults write NSGlobalDomain KeyRepeat -int 2
