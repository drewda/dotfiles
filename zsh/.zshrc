# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search autojump autoenv)

source $ZSH/oh-my-zsh.sh

# history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# disable correct
unsetopt correct_all

# Customize to your needs...

# PATH="/Users/drew/software/android/android-sdk-mac/platform-tools:/Users/drew/software/android/android-sdk-mac/tools:$PATH"

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# export PATH="/usr/local/share/npm/bin:$PATH"
# export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
# export PATH="$NODE_PATH:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# source /usr/local/opt/autoenv/activate.sh
export PATH=/usr/local/bin:$PATH

export GITHUB_TOKEN=c13f9fac438d20849cd58674e056dfd2d14f1dd2

export EDITOR='code'
#source ~/.rbenv/versions/2.2.3/bin/tmuxinator.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/sbin:$PATH"

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
path=(
  $path
  $GOPATH/bin
  $GOROOT/bin
)