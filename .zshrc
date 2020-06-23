export PATH=$PATH:~/.local/bin:~/builds/miniconda3/bin
export PATH=~/fake/usr/bin:$PATH
[[ "$TTY" == "/dev/tty1" ]] && startx

export EDITOR=nvim
export TERMINAL=kitty
export PAGER=less

fpath+=~/.zfunc

export POETRY_HOME=~/builds/poetry
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export GIT_ASKPASS=$HOME/.config/gitask

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="typewritten"
export TYPEWRITTEN_PROMPT_LAYOUT='multiline'

DISABLE_MAGIC_FUNCTIONS=true
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="false"

plugins=(
	fzf
	fd
	ripgrep
	colored-man-pages
	git
    extract
    cargo
    # fast-syntax-highlighting
)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --height 60% --reverse
 --color=fg:#fcffcf,bg:#37373d,hl:#65c3eb
 --color=fg+:#5cf53d,bg+:#37373d,hl+:#fcccff
 --color=info:#ce96d9,prompt:#47ceff,pointer:#ff173e
 --color=marker:#b8c4ff,spinner:#fb26ff,header:#c6eaf7'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='``'
export _ZL_CMD='j'
source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^U' backward-kill-line
eval "$(lua ~/builds/z.lua/z.lua --init zsh)"
autoload -U compinit
compinit

alias sz="source ~/.zshrc"
alias mpv='mpv'
alias s='sxiv'
alias z='zathura'
alias v=nvim
alias z="zathura --fork"
alias zz="v ~/.zshrc"
alias zo="zuluCrypt-cli -o -d ~/backup/crypt -t vera -m /run/media/private -p"
alias zc="zuluCrypt-cli -q -d ~/backup/crypt"
alias gs='git status'
alias xi='xclip -selection clipboard -i'
alias xo='xclip -selection clipboard -o'
alias sudo='sudo '
alias d='cd ~/dots'
alias e='less'
alias p='pacman'
alias py='python'
alias ud="sudo sh -c 'make && make install'"
alias ee="extract"
alias cp="cp -r"
alias ss="~/dots/sxhkd/scripts"
alias hh="fc -ln -1 | xi"
alias sl="ls"
alias ep='echo $PATH'
alias sv='sudo -E nvim'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH=$PATH:~/dots/coc/extensions/coc-omnisharp-data/server:~/dots/coc/extensions/coc-rust-analyzer-data
