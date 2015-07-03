# Prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$  \n| => "
export PS2="| => "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# OS X Aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Dev Scripts
alias installDevTools='
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &
  brew install wget unrar'
