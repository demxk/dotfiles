[[ "$TTY" == "/dev/tty1" ]] && startx

export EDITOR=nvim
export TERMINAL=alacritty
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZSH=$HOME/.oh-my-zsh


ZSH_THEME="typewritten"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
	fzf
	fd
	ripgrep
	colored-man-pages
	git
    extract
)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --height 60% --reverse
 --color=fg:#fcffcf,bg:#37373d,hl:#65c3eb
 --color=fg+:#5cf53d,bg+:#37373d,hl+:#fcccff
 --color=info:#ce96d9,prompt:#47ceff,pointer:#ff173e
 --color=marker:#b8c4ff,spinner:#fb26ff,header:#c6eaf7'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source $ZSH/oh-my-zsh.sh

source /usr/share/fzf/key-bindings.zsh
bindkey "^U" backward-kill-line

alias sz="source ~/.zshrc"
alias v=nvim
alias z="zathura --fork"
alias zz="v ~/.zshrc"
alias zo="zuluCrypt-cli -o -d ~/backup/crypt -t vera -m /run/media/private -p"
alias zc="zuluCrypt-cli -q -d ~/backup/crypt"
alias gs='git status'
alias x='xclip -selection clipboard'
alias sudo='sudo '
alias d='cd ~/dots'
