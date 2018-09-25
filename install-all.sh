#!/usr/bin/env bash

bash brew.sh

brew install zsh zsh-completion sbt scala git jenv rustup-init
brew cask install alfred atom java java8 dash 1password docker firefox google-chrome iterm2

brew cask install sublime-text atom

bash zsh/conf.sh
bash git/conf.sh

bash atom/init.sh
bash sbt/conf.sh
bash jenv/conf.sh
bash iTerm2/conf.sh