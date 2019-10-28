local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful")
local awful = require("awful")
local config = {}
require('misc/print_r')

config.modkey = "Mod4"

config.confd = string.format("%s/.config/awesome/", os.getenv("HOME")) .. 'conf.d/'

config.terminal = "x-terminal-emulator"

config.autorun_apps = {
    'xrdb -merge ~/.Xresources',
    'setxkbmap -config ~/.keyboard',
    'unclutter -keystroke',
    'xrandr-setup',
    'qutebrowser'
    --'tmux-project rails', { name = 'web' }.
}

config.network_interface = "wlo1"

config.awfulrules = {
    --[[
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            opacity = 0,
            keys = keybindings.client,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false,
            maximized_vertical = false,
            maximized_horizontal = false
        },
        {
            rule = { class = "qutebrowser" },
            callback = function(c)
            end
        },
        {
            rule = { class = "dosbox" },
            callback = function(c)
                awful.spawn('mpc pause')
            end
        }
    }
    ]]--
}

config.clock_format = "%A %B %d, %I:%M%"

--[[
    s.bottomwibox = awful.wibar({
        position = "bottom",
        screen = s,
        height = 40,
	opacity = beautiful.wibar_opacity or 1
    })

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"
    s.bottomwibox:setup {
        layout = wiboxlayout,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.cpu,
            space,
            widgets.cpu_temp,
            space,
            widgets.mem,
            space,
            widgets.net,
            space,
            widgets.vitae,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.clock
        },
    }
]]--

--[[
config.wibars = {
    {
        settings = {
            position = "top",
            screen = s,
            height = 40,
            layout = "horizontal"
        },
        setup = {
            layout = wiboxlayout,
            {
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                --widgets.get()
                widgets.cpu,
                space,
                widgets.cpu_temp,
                space,
                widgets.mem,
                space,
                widgets.net,
                space,
                widgets.vitae,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                widgets.clock
            }
        }
    },
    {
        setttings = {
            position = "right",
            screen = s,
            height = 40,
            layout = "vertical"
        },
        setup = {
            layout = wiboxlayout,
            {
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                --widgets.get()
                widgets.cpu,
                space,
                widgets.cpu_temp,
                space,
                widgets.mem,
                space,
                widgets.net,
                space,
                widgets.vitae,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                widgets.clock
            }
        }
    }
}
]]--

config.keys = {
    ['global'] = {
        {
            { config.modkey }, 'a',
            hotkeys_popup.show_help,
            {
                description = "Show this help screen",
                group = "Awesome"
            }
       },
       {
       }
    },
    ['client'] = {
        -- Close client
        -- Move to next screen
    },
}

return config
