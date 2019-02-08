local keys = require("main_keys")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local config = {}
local settings = {}

config.modkey = "Mod4"

config.terminal = "x-terminal-emulator"

config.autorun_apps = {
    'xrdb -merge ~/.Xresources',
    'setxkbmap -config ~/.keyboard',
    'unclutter -idle 1 -root',
    'xrandr-setup'
}

config.inet_interface = "wlo1"

config.clock_format = "%A %B %d, %I:%M%"

config.wibars = {
}

config.keys = {
    ["global"] = {
        {
            { config.modkey }, keys.help,
            hotkeys_popup.show_help,
            {
                description = "Show this help screen",
                group = "Awesome"
            }
       },
       {
       }
    },
    ["client"] = {
        -- Close client
        -- Move to next screen
    },
}
return config
