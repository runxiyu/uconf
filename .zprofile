# Configuration and data file path clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

if [ "$(uname)" = "Darwin" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
elif [ "$(uname)" = "Linux" ]; then
	export GDK_BACKEND="wayland"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
