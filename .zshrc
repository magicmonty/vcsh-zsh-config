# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="monty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github sublime)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/Development/go
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$GOPATH/bin
export DOCKER_HOST=tcp://127.0.0.1:4244
export EDITOR=/usr/local/bin/vim

if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source $HOME/dotfiles/chgo/share/chgo/chgo.sh
  source $CHGO_ROOT/share/chgo/auto.sh
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
fi

w() {
    clear &&  ls -l && echo && git branch && echo && git status --short --branch
}

dn() {
    git status --short --branch | grep '^.[DM\?]' | head -1 | awk '$1 ~ /[MD]/ {print $2} $1 ~ /\?/ {print "/dev/null " $2}' | xargs git diff -- && w
}

an() {
    git status --short --branch | grep '^.[DM\?]' | head -1 | awk '$1 ~ /[M?]/ {print "add " $2} $1 ~ /D/ {print "rm " $2}' | xargs git && w
}

export TERM=xterm-256color
#export CLICOLOR=1
#export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
#export LS_COLORS="di=36;40:ln=35;40:so=31;:pi=0;:ex=1;;40:bd=0;:cd=37;:su=37;:sg=0;:tw=0;:ow=0;:"
#export GREP_OPTIONS='--color=auto'


alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'

alias got='git '
alias get='git checkout'
alias code='open "/Applications/Visual Studio Code.app" --args "$PWD"'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
test -e ${HOME}/.keys && source ${HOME}/.keys

# added by travis gem
[ -f /Users/martingondermann/.travis/travis.sh ] && source /Users/martingondermann/.travis/travis.sh
export PATH="/usr/local/sbin:$PATH:/usr/local/texlive/2015/bin/x86_64-darwin"
export DYLD_LIBRARY_PATH="/usr/local/Cellar/mono/4.2.1.102_1/lib"
