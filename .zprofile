# Configuration and data file path clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

export CALIBRE_USE_SYSTEM_THEME=true

if [ "$(uname)" = "Darwin" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
	export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
elif [ "$(uname)" = "Linux" ]; then
	export GDK_BACKEND=wayland
	export GDK_DEBUG=gl-no-fractional
	export QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor # fix QtWebView
	export SDL_VIDEODRIVER=wayland
fi

export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"

