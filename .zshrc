ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(asdf bundler capistrano catimg colorize command-not-found gem git osx ssh-agent zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit

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
alias ls='colorls -lA --sd'
alias pp='pull && git push'
alias pi='pod install --verbose --no-repo-update'
alias pull='ggpur'
alias rdm='bin/rails db:migrate && bin/rails db:migrate RAILS_ENV=test'
alias rdr='bin/rails db:rollback && bin/rails db:rollback RAILS_ENV=test'

# Thanks reddit! (͡° ͜ʖ ͡°)
# https://www.reddit.com/r/vim/comments/42fwjx/when_vim_leaves_a_trail/cza0azv
alias :wq="echo \"This isn't nvim!\""
alias :wq!=:wq
alias :q=:wq
alias :qa=:wq
alias :q!=:wq

# Goodbye, VIM
# https://robots.thoughtbot.com/my-life-with-neovim
if type nvim > /dev/null 2>&1; then
  # https://stackoverflow.com/a/2596835
  export VISUAL="nvim"
  export EDITOR="$VISUAL"

  alias vim="$VISUAL"

  ln -sf ~/.vimrc ~/.config/nvim/init.vim
fi

# https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
# Setting ag as the default source for fzf
# Replace ag with RIPgrep
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://junegunn.kr/2015/03/browsing-git-commits-with-fzf
# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fzhow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if [[ "$OSTYPE" == "linux-gnu"*  ]]; then
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
fi

# deno hype!
export DENO_INSTALL="/home/bbibbin/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Docker configuration
export PATH="$PATH:$HOME/.local/bin"

# Replace rbenv with asdf
. $HOME/.asdf/asdf.sh

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
