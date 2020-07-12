if status --is-interactive
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# if test "$TTY" -eq "/dev/tty1"
#     startx
# end
set -q TMUX && set -x NVIM_LISTEN_ADDRESS /tmp/nvim_(tmux display -p "#{session_id}")

abbr -a spl string split ' '
abbr -a tt tmux
abbr -a tl tmux ls
abbr -a ta tmux attach -t
abbr -a tk tmux kill-session -t

abbr -a v nvim
abbr -a z zathura --fork

abbr -a sf source ~/dots/fish/config.fish
abbr -a vv nvim ~/dots/nvim/init.vim
abbr -a nf nvim ~/dots/fish/config.fish

abbr -a fp fish --private
abbr -a ep echo $PATH

abbr -a jr j -r
abbr -a jt j -t
abbr -a jx j -x

abbr -a i xclip -selection clipboard -i
abbr -a o xclip -selection clipboard -o
abbr -a zo zuluCrypt-cli -o -d ~/backup/crypt -t vera -m /run/media/private -p
abbr -a zc zuluCrypt-cli -q -d ~/backup/crypt

# git abbr
abbr -a gd "git diff -M"
abbr -a ga "git add"
abbr -a gaa "git add --all ."
abbr -a gs "git status"
abbr -a gbd "git branch -D"
abbr -a gca "git commit -a -m"
abbr -a gm "git merge --no-ff"
abbr -a gpt "git push --tags"
abbr -a gp "git push"
abbr -a grh "git reset --hard"
abbr -a gb "git branch"
abbr -a gcob "git checkout -b"
abbr -a gco "git checkout"
abbr -a gba "git branch -a"
abbr -a gcp "git cherry-pick"

set -g pure_color_mute magenta
set -g pure_color_success green
set -g PF_INFO ascii title os shell editor wm font uptime pkgs memory
set -g fish_pager_color_progress yellow
set -g TERM screen-256color

bind \cj history-prefix-search-forward
bind \ck history-prefix-search-backward
bind \cy accept-autosuggestion
bind \ce end-of-line

bind \cl forward-word
bind \ch backward-word
