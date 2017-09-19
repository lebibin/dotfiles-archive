ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dracula"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(bundler capistrano catimg colorize command-not-found gem git osx ssh-agent zsh-syntax-highlighting)

export PATH="/usr/local/bin:$PATH"
export EDITOR='vim'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# https://webdevstudios.com/2015/02/10/a-beginners-guide-to-the-best-command-line-tools/
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Let's GO!
export GOPATH=$HOME/Code/go
export PATH="$GOPATH/bin:$PATH"

# Yarn for react-native
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# Use rbenv instead
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

source $ZSH/oh-my-zsh.sh
source ~/.git-flow-completion.zsh
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH" # Add Postgres.app to PATH

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# added by travis gem
[ -f /Users/$USER/.travis/travis.sh ] && source /Users/$USER/.travis/travis.sh

# Here be the aliases
alias c='clear'
alias cpr='bundle exec cap production mb:sidekiq:stop mb:unicorn:stop mb:unicorn:start mb:sidekiq:start'
alias csr='bundle exec cap staging mb:sidekiq:stop mb:unicorn:stop mb:unicorn:start mb:sidekiq:start'
alias fs='bundle exec foreman start'
alias hrkoff='heroku ps:scale web=0'
alias hrkon='heroku ps:scale web=1'
alias pp='pull && git push'
alias pi='pod install --verbose --no-repo-update'
alias pull='ggpur'
alias rdm='bin/rails db:migrate && bin/rails db:migrate RAILS_ENV=test'
alias rdr='bin/rails db:rollback && bin/rails db:rollback RAILS_ENV=test'

# Thanks reddit! (͡° ͜ʖ ͡°)
# https://www.reddit.com/r/vim/comments/42fwjx/when_vim_leaves_a_trail/cza0azv
alias :wq="echo \"This isn't vim, asshole!\""
alias :wq!=:wq
alias :q=:wq
alias :qa=:wq
alias :q!=:wq

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
