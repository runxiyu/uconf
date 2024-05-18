set -x
gh repo create "$1" --disable-issues --disable-wiki -d 'Mirror of https://git.runxiyu.org/runxiyu/current/'"$1"'.git/. Send patches to https://lists.sr.ht/~runxiyu/public-inbox. Pull requests are ignored.' --public && git remote set-url --add --push origin github:runxiyu/"$1".git && git push
