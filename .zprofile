#!/bin/zsh
# Shouldn't actually be run directly, obviously

ulimit -c unlimited

export PATH="$HOME/.local/share/npm/bin:$PATH"
if [ -d "/opt/homebrew/bin" ]
then
	export PATH="/opt/homebrew/bin:$PATH"
fi
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.local/share/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/infrastructure/rxmenus:$PATH"
export PATH="$HOME/misc:$PATH"
unsetopt PROMPT_SP
export EDITOR="nvim"
export TERMINAL="foot"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # May break some WMs
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export UNISON="$XDG_DATA_HOME/unison"
export HISTFILE="$XDG_DATA_HOME/history"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

export DICS="/usr/share/stardict/dic/"
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2="1"
export GDK_BACKEND="wayland"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && setsid shortcuts >/dev/null 2>&1


sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null

# umask 007


PLAN9="$HOME"/ext/plan9port
export PLAN9
PATH=$PATH:$PLAN9/bin
export PATH

#export GOPROXY=https://mirrors.aliyun.com/goproxy/
#export GOPROXY=https://goproxy.io,direct

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# GTK_IM_MODULE=fcitx
export QT_IM_MODULES="wayland;fcitx;ibus"
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1.25
export MANWIDTH=80

export CVSROOT="$HOME/.local/cvsroot"
test -r /home/runxiyu/.opam/opam-init/init.sh && . /home/runxiyu/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

eval "$(/opt/homebrew/bin/brew shellenv)"
export LC_CTYPE=en_US.UTF-8
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# [ "$(tty)" = "/dev/tty1" ] && ! pidof -s sway >/dev/null 2>&1 && exec dbus-run-session -- sway

