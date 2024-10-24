# Verbose push
function git {
	if [[ "$1" == "push" && "$@" != *"--help"* ]]; then
		shift 1
		command git push -v "$@"
	else
		command git "$@"
	fi
}

alias uconf="git --git-dir=$HOME/.local/share/uconf.git --work-tree=$HOME"
