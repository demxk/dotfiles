function hh -d 'Copy last n commands to clipboard'
    history | head -n $argv | xclip -i -selection clipboard
end
