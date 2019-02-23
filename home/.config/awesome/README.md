# AwesomeWM config

My config for Awesome has been tweaked and tweaked and tweaked, to the point where I don't know of any other AwesomeWM setup like mine.

My setup isn't complicated, but I've always had a few goals in mind;

1. Be as mouseless as possible (but still have it there - I use GIMP!).
2. Limit the amount I have to move my fingers for shortcuts.
3. Have a very minimalistic approach.
4. Allow for lots of screen real-estate.
5. Only have keybindings that are needed.

With that being said, here's some things you should know;

## Tags

I like to have only 4 tags per screen. This means I can easily access them using the 4 fingers of my right hand resting on the right-side of the home row (see keybindings below). If I ever need more than 5 tags, I probably have too many windows open.

## Keybindings

My keybindings are completely dynamic, depending on what keyboard layout is active. Right now, my setup supports _qwerty_ and _colemak_.

All keybindings are MOD+key. My MOD key is set to the SUPER key ("windows key"). Holding 2 keys while pressing a 3rd goes against goal 2. You did read them, right?

To be honest, the following keybindings took me a little getting used to, but it was worth it.

Key qwerty | Key colemak | Action
------------ | -------------
<kbd>q</kbd> | <kbd>q</kbd> | Restart AwesomeWM
<kbd>e</kbd> | <kbd>f</kbd> | Focus previous client
<kbd>r</kbd> | <kbd>p</kbd> | Focus next client
<kbd>t</kbd> | <kbd>g</kbd> | Rofi run dialog
<kbd>y</kbd> | <kbd>j</kbd> | Rofi window dialog
<kbd>j</kbd> | <kbd>n</kbd> | Focus tag `1`
<kbd>k</kbd> | <kbd>e</kbd> | Focus tag `2`
<kbd>l</kbd> | <kbd>i</kbd> | Focus tag `3`
<kbd>;</kbd> | <kbd>o</kbd> | Focus tag `4`
<kbd>u</kbd> | <kbd>l</kbd> | Move client to tag `1`
<kbd>i</kbd> | <kbd>u</kbd> | Move client to tag `2`
<kbd>o</kbd> | <kbd>y</kbd> | Move client to tag `3`
<kbd>p</kbd> | <kbd>;</kbd> | Move client to tag `4`
<kbd>d</kbd> | <kbd>s</kbd> | Swap window with previous client
<kbd>f</kbd> | <kbd>t</kbd> | Swap window with next client
<kbd>g</kbd> | <kbd>d</kbd> | Decrease master width
<kbd>h</kbd> | <kbd>h</kbd> | Increase master width
<kbd>j</kbd> | <kbd>n</kbd> | Move client to next screen
<kbd>c</kbd> | <kbd>c</kbd> | Focus previous screen
<kbd>v</kbd> | <kbd>v</kbd> | Focus next screen
<kbd>.</kbd> | <kbd>.</kbd> | Help screen
<kbd>/</kbd> | <kbd>/</kbd> | Open terminal
<kbd>z</kbd> | <kbd>z</kbd> | Close 

<kbd>space</kbd> | <kbd>space</kbd> | Switch layout

## Autoloading files

The files in `conf.d/` are loaded automatically. Be sure to test anything with `xephyr` (see below) before restarting Awesome.

# Testing with `Xephyr`

There's a shell script at `scripts/debug.sh` that will run `xephyr` so that a live version of the config can be tested.

If a file exists at `xephyr.lua`, it will be injected into the xephyr session.

## Automatic hotkeys loading

Bringing up the help screen (see keybindings) will show a list of shortcuts. Files in `hotkeys/` will be automatically loaded. This can be used to extend the help/hotkeys window.
