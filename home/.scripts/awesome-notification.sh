#!/bin/bash

if [ $1 ]; then
    echo "naughty.notify({
        bg = theme."$1",
        fg = theme."$2",
        title = '"$3"',
        text = '"$4"',
        timeout = 10
    })" | awesome-client
fi
