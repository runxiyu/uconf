#!/bin/sh
CGO_ENABLED=0 go build -ldflags '-extldflags "-f no-PIC -static"' -tags 'osusergo netgo static_build' "$@"
