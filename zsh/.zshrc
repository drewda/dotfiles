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
plugins=(git history-substring-search autojump rake)

source $ZSH/oh-my-zsh.sh

# disable correct
unsetopt correct_all

# Customize to your needs...

PATH="/Users/drew/software/android/android-sdk-mac/platform-tools:/Users/drew/software/android/android-sdk-mac/tools:$PATH"

export PATH="/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH="$NODE_PATH:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "`npm completion`"