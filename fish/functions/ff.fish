function ff -d 'Open fish function in editor'
    set -l fn (fd . ~/dots/fish/functions | fzf)
    and nvim $fn
end
