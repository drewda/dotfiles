# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git history-substring-search autojump)

source $ZSH/oh-my-zsh.sh

# history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# disable correct
unsetopt correct_all

# rbenv for Ruby version management
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# lazy loading of NVM for NodeJS version management
source /Users/drew/.znvm/znvm.sh

# Visual Studio Code as default text editor
export EDITOR='code'

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# direnv (replaces autoenv)
eval "$(direnv hook zsh)"