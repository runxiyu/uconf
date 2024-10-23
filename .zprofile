if [ "$(uname)" = Darwin ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
elif [ "$(uname)" = Linux ]; then
fi

export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
