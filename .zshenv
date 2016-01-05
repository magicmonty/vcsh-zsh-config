export -TU GOPATH gopath
gopath=~/Development/go

typeset -U path
path=(/usr/local/sbin/ ~/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/git/bin $gopath/bin /usr/local/texlive/2015/bin/x86_64-darwin $path)

source /usr/local/opt/chruby/share/chruby/chruby.sh
source $HOME/dotfiles/chgo/share/chgo/chgo.sh
source $CHGO_ROOT/share/chgo/auto.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
