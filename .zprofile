export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

if [ "$(uname)" = Darwin ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
elif [ "$(uname)" = Linux ]; then
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
