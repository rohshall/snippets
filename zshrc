# Colors
autoload -U colors
colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt prompt_subst

# Prompt
PROMPT='%F{green}%f %F{yellow}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

alias ls='ls --color'
