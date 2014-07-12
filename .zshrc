ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(capistrano colorize command-not-found gem git bundler ssh-agent sublime virtualenv)

export PATH="/usr/local/bin:$PATH"
export EDITOR='subl'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
source $ZSH/oh-my-zsh.sh
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"
