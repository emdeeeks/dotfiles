#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $DIR
DIR=$HOME/.themes/xresources
echo $DIR

array_xresources=( foreground background color0 color1 color2 color3 color4 color5 color6 color7 )
array_friendly=( fg bg black red green yellow blue magenta cyan white )

echo -n "" > $DIR/gtk-3.0/colors.css
echo -n "gtk-color-scheme = \"" > $DIR/gtk-2.0/colors
for item in ${!array_xresources[*]}
do
    hex=`xrdb -query | grep -i ${array_xresources[$item]} | head -1 | awk '{print $2}'`
    echo "@define-color color_${array_friendly[$item]} ${hex};" >> $DIR/gtk-3.0/colors.css
    echo -n "color_${array_friendly[$item]}: ${hex}\n" >> $DIR/gtk-2.0/colors
done
echo -n "\"" >> $DIR/gtk-2.0/colors
sed "s,\n$,," $DIR/gtk-2.0/colors
