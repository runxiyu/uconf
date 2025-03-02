export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export INPUTRC="$XDG_CONFIG_HOME/inputrc"

export EDITOR="nvim"

export GOPROXY=direct
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PATH="$GOPATH/bin:$PATH"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland

# export QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor
# export QT_QPA_PLATFORMTHEME=qt6ct

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export MANWIDTH=72

[ -z "$TMUX" ] && { eval "$(ssh-agent -s)" && ssh-add; }


if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
