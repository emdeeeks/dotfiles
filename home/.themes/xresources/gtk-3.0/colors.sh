#!/bin/bash

array_xresources=( foreground background color0 color1 color2 color3 color4 color5 color6 color7 )
array_friendly=( fg bg black red green yellow blue magenta cyan white )

echo -n "" > colors.css
for item in ${!array_xresources[*]}
do
    hex=`xrdb -query | grep -i ${array_xresources[$item]} | head -1 | awk '{print $2}'`
    #echo ${array_friendly[$item]}
    echo "@define-color color_${array_friendly[$item]} ${hex};" >> colors.css
done
