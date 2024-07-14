autoload -U colors && colors

function git_branch_name() {
	branch=$(git symbolic-ref HEAD 2> /dev/null | cut -d '/' -f 3-)
	if [[ $branch == "" ]];
	then
		:
	else
		echo " $branch"
	fi
}

setopt prompt_subst

# prompt='%B%{$fg[blue]%}[%{$fg[blue]%}%n %{$fg[green]%}%~%{$fg[yellow]%}$(git_branch_name)%{$fg[blue]%}]$%b '
prompt='%B%{$fg[green]%}%~%{$fg[yellow]%}$(git_branch_name) %{$fg[blue]%}$%b '

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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
export GPG_TTY=$(tty)

alias uconf="git --git-dir=$HOME/.local/share/uconf.git --work-tree=$HOME"

alias vim="nvim" vimdiff="nvim -d"
alias mbsync="mbsync -c $MBSYNCRC"

alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vi" \
	bc="bc -ql" \
	rsync="rsync -vrPlu" \
	mkd="mkdir -pv" \

alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	gpg="gpg --expert" \
	ls="ls --color=auto --group-directories-first"
#	ip="ip -color=auto"

alias \
	ka="killall" \
	g="git" \
	sdn="sudo shutdown -h now" \
	v="$EDITOR" \
	z="zathura"

alias fzo="fzf | xargs -d $'\n' xdg-open"
alias bright="brightnessctl set"
alias mypy="python3 -m mypy --strict"
alias venv=". $HOME/.local/share/venv/bin/activate"

# if [ "$(uname)" != "Darwin" ]
# then
# 	alias git="today git"
# fi

e() {
	emacsclient -c "$@" &
}
ex() {
	emacsclient -c "$@" &
	exit
}

alias gcc="gcc -Wall -Wextra -pedantic"
alias cc="gcc -Wall -Wextra -pedantic"

function cd_list() {
	emulate -L zsh
	ls
}
chpwd_functions=(${chpwd_functions[@]} "cd_list")

export QT_ENABLE_HIGHDPI_SCALING=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1.5
export QT_SCALE_FACTOR=1.5
