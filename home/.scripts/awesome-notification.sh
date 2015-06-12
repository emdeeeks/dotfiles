#!/bin/bash

if [ $1 ]; then
    echo "naughty.notify({
        bg = theme.black,
        fg = theme."$1",
        title = '"$2"',
        text = '"$3"', 
        timeout = 10
    })" | awesome-client
fi
