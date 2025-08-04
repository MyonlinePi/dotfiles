if status is-interactive
#
function fish_greeting
    fastfetch
end
#
# Commands to run in interactive sessions can go here
set -Ux LANG en_GB.UTF-8
set -Ux LANGUAGE en_GB:en
set -Ux LC_ALL en_GB.UTF-8
# set -g -x fish_greeting 'Welcome to my server!'
#atuin
set -gx ATUIN_NOBIND "true"
atuin init fish | source
# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search
# Bind ctrl-r but not up arrow
eval "$(atuin init fish --disable-up-arrow)"
# zoxide
zoxide init fish | source
zoxide init --cmd cd fish | source
# Set up fzf key bindings
fzf --fish | source
#
### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# Changing "ls" to "eza"
# alias ls='eza -alg -s=Name --icons --group-directories-first'
abbr --add ls eza -alg -s=Name --icons --group-directories-first
abbr --add lt eza -algT -s=Name --icons --group-directories-first
abbr --add lst eza -alg -s=modified --icons --group-directories-first
abbr --add ltt eza -algT -s=modified --icons --group-directories-first
#
abbr --add aud "sudo apt update && apt list --upgradeable"
abbr --add aug "sudo apt full-upgrade -y && sudo apt autoremove"
abbr --add lzd lazydocker
abbr --add dcu "docker compose up -d"
abbr --add dcs "dockcheck.sh -p -s"

# replaces !! with the result of last_history_item Similar to !! bash history expansion 
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
#
#function yy
#	set tmp (mktemp -t "yazi-cwd.XXXXXX")
#	yazi $argv --cwd-file="$tmp"
#	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
#		cd -- "$cwd"
#	end
#	rm -f -- "$tmp"
#end
#
starship init fish | source
end
