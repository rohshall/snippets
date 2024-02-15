# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#alias ls='ls --color'

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

PS1="\[\033[01;32m\]\u[\[\033[01;34m\]\w\[\033[00m\]] \[\e[91m\]\$(parse_git_branch)\[\e[00m\] $ "

source /opt/local/share/fzf/shell/key-bindings.bash
source /opt/local/share/nvm/init-nvm.sh
