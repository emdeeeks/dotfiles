#!/bin/bash

##set -x

if [ "$2" != "" ]; then
    echo "naughty.notify({
        bg = theme.black,
        fg = theme."$1",
        title = '"$2"',
        text = '"$3"', 
        timeout = 10
    })" | awesome-client
else
    echo "naughty.notify({
        bg = theme.black,
        fg = theme."$1",
        text = '"$4"', 
        timeout = 10
    })" | awesome-client
fi
