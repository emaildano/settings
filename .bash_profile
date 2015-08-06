# Prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$  \n| => "
export PS2="| 🍔 "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -GFh'

# OS X Aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Bash
alias reload='source ~/.bash_profile'

# Ansible
alias hosts='/etc/ansible/hosts'

alias getAwsHosts='
  rm -rf ~/.ansible/hosts ~/.ansible/ec2.ini &&
  wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py -o ~/.ansible/hosts &&
  wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini -P ~/.ansible'

# NPM
alias cleannpm='for package in `ls node_modules`; do npm uninstall $package; done;'

# Homebrew
alias installhomebrew='ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
export PATH="$HOME/.node/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
