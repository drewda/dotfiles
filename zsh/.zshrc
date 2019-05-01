# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git history-substring-search fzf)

# NVM for Node version management
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-nvm ]]; then
  plugins+=(zsh-nvm)
fi

source $ZSH/oh-my-zsh.sh

# history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
alias jo="/usr/local/bin/jo" # give priority to the jo (JSON creation) command

# disable correct
unsetopt correct_all

# rbenv for Ruby version management
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python 
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Visual Studio Code as default text editor
export EDITOR='code'

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# direnv (replaces autoenv)
eval "$(direnv hook zsh)"

# golang
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:$PATH"

# GCP
if [[ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
  export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
fi

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /Users/drew/.npm/_npx/23443/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/drew/.npm/_npx/23443/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

# use homebrew findutils instead of Mac versions
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"