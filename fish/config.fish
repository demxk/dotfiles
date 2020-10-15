# complete funcs for aws and dotnet
complete --command dotnet --arguments '(dotnet complete (commandline -cp))'
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end

function key
    xclip -selection clipboard -i < dots/unz/masterFir
end

function ... -d 'expand ... to ../../'
  ../..
end

function .... -d 'expand .... to ../../../'
  ../../..
end

alias cdp 'cd ~/Projects'

alias upra 'curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer'

abbr --add -- - 'cd -'
abbr --add md mkdir
abbr --add xo xdg-open

# abbr for history merging between fish instances
abbr --add hh history merge
abbr --add d 'cd ~/dots'

abbr --add v nvim
abbr --add nv nvim
abbr --add nvi nvim
abbr --add z zathura --fork
abbr --add pu pulumi
abbr --add ru rustup
abbr --add sue sudoedit
abbr --add cat bat -p

abbr --add sf source ~/dots/fish/config.fish
abbr --add vv nvim ~/dots/nvim/init.vim
abbr --add ff nvim ~/dots/fish/config.fish
abbr --add zz nvim ~/.zshrc

abbr --add fp fish --private
abbr --add ep 'echo $PATH'

abbr --add jr j -r
abbr --add jt j -t
abbr --add jx j -x

abbr --add i xclip -selection clipboard -i
abbr --add o xclip -selection clipboard -o

# git abbr
abbr --add gd "git diff -M"
abbr --add ga "git add"
abbr --add gau "git add -u"
abbr --add gaa "git add --all ."
abbr --add gs "git status"
abbr --add gl 'git log'
abbr --add glo 'git log --oneline'
abbr --add gbd "git branch -D"
abbr --add gca "git commit -a -m"
abbr --add gcm "git commit -m"
abbr --add gm "git merge --no-ff"
abbr --add gpt "git push --tags"
abbr --add gp "git push"
abbr --add grh "git reset --hard"
abbr --add gb "git branch"
abbr --add gcob "git checkout -b"
abbr --add gco "git checkout"
abbr --add gba "git branch -a"
abbr --add gcp "git cherry-pick"

set -g pure_color_mute magenta
set -g pure_color_success green
set -g PF_INFO ascii title os shell editor wm font uptime pkgs memory
set -g fish_pager_color_progress yellow
set -g TERM screen-256color

bind \cj history-prefix-search-forward
bind \ck history-prefix-search-backward
# bind \cy accept-autosuggestion execute
bind \cf accept-autosuggestion
bind \ce execute

bind \cl forward-word
bind \ch backward-word
