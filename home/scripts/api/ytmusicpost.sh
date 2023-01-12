#!/bin/sh

[ "$1" = "pause" ] && \
curl -X POST -d '{"command": "track-pause"}' http://localhost:9863/query

[ "$1" = "next" ] && \
curl -X POST -d '{"command": "track-next"}' http://localhost:9863/query

[ "$1" = "previous" ] && \
curl -X POST -d '{"command": "track-previous"}' http://localhost:9863/query
