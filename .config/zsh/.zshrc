autoload -U colors && colors
PS1="%B%{$fg[blue]%}[%{$fg[blue]%}%n%{$fg[blue]%}@%{$fg[blue]%}%M %{$fg[green]%}%~%{$fg[blue]%}]$%b "
setopt autocd
stty stop undef
setopt interactive_comments

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
export GPG_TTY=$(tty)

alias uconf="git --git-dir=$HOME/.local/share/uconf.git --work-tree=$HOME"
