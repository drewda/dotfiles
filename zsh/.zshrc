# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"export NVM_DIR="$HOME/.nvm"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

# history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# disable correct
unsetopt correct_all

# rbenv for Ruby version management
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python 
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# NodeJS: we're only using 8.x
export PATH="/usr/local/opt/node@8/bin:$PATH"

# Visual Studio Code as default text editor
export EDITOR='code'

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# direnv (replaces autoenv)
eval "$(direnv hook zsh)"

# golang
export PATH="/Users/drew/go/bin:$PATH"

# GCP
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"

# Cargo (Rust package manager)
# export PATH="/Users/drew/.cargo/bin:$PATH"