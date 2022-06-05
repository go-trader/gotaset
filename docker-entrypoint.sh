#!/bin/bash
set -e

if [[ "$1" = 'gotaset' ]]; then
    exec /opt/gotaset_linux "$2"
else
    exec "$@"
fi