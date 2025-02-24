# Configuration and data file path clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export GOPROXY=direct
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
	export QT_QPA_PLATFORMTHEME=qt6ct
	export SDL_VIDEODRIVER=wayland
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	# . "$HOME/.cargo/env"
	export LD_LIBRARY_PATH="$HOME/Programming/hax_string/:$HOME/Programming/hax_table/"
	export HAX_STRING_PATH="$HOME/Programming/hax_string/"
	export HAX_TABLE_PATH="$HOME/Programming/hax_table/"
	export HAX_LOADER_PATH="$HOME/Programming/hax_loader/"
	export PYTHONPATH="$PYTHONPATH:$HOME/Programming/sjdb-src/"
	export PLAN9="/usr/lib/plan9"
	export PATH="$PATH:$PLAN9/bin"
	[ -d /usr/lib/plan9 ] && export PLAN9='/usr/lib/plan9' || export PLAN9="/home/runxiyu/External/plan9port"
	export PATH="$PATH:$PLAN9/bin"
fi

export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"

if [ "$(uname)" = "Linux" ]; then
	if [ "$(tty)" = "/dev/tty1" ]; then
		sway
	fi
fi

. "$HOME/.cargo/env"      


