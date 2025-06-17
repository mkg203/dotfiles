# oh-my-posh init fish | source
fzf --fish | source

zoxide init --cmd j fish | source
starship init fish | source

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
if [ $TERM = "xterm-kitty" ]
    alias ssh='kitten ssh'
end

# function fish_prompt
#
#   # interactive user name @ host name, date/time in YYYY-mm-dd format and path
#
#   echo (whoami) (date '+%Y-%m-%d %H:%M:%S') (pwd)
#
#   echo "Σ "
#
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting 

# ALIASES

alias o='xdg-open'
alias nv='nvim'
alias warpc='warp-cli connect'
alias warpdc='warp-cli disconnect'
alias warps='warp-cli status'
# alias kssh='kitten ssh'

set -x PATH /usr/local/cuda/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/cuda-12.2/lib64 $LD_LIBRARY_PATH
set -x CUDNN_PATH "/home/linuxbrew/.linuxbrew/lib/python3.11/site-packages/nvidia/cudnn"
set -x LD_LIBRARY_PATH "$CUDNN_PATH/lib" "/usr/local/cuda/lib64"

set -x PATH $PATH "/usr/local/cuda/bin"

export EDITOR=nvim

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

fish_vi_key_bindings
set -x PATH /home/muku/Desktop"/git-fuzzy/bin:$PATH"
 

fish_add_path /home/muku/.spicetify

abbr -a ls eza

set fish_sequence_key_delay_ms 150
bind --mode insert --sets-mode default jj repaint
