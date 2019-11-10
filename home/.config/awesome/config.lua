local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local misc = require("misc")
local keys = require("misc.keys")

local config = {}

config.modkey = "Mod4"

config.layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top
}

config.terminal = "x-terminal-emulator"

config.autorun_apps = {
    'unclutter -keystroke',
    { 'setxkbmap -config ~/.keyboard', {}, { shell = true }},
    'xrandr-setup',
    'dropbox start',
    'qutebrowser',
    { 'htop', { }, { terminal = true }}
}

config.keys = {
    ['global'] = awful.util.table.join(

        -- Help
        awful.key(
            { config.modkey, }, keys.help,
            hotkeys_popup.show_help,
            { description = "show this help screen", group = "awesome" }
        ),
        awful.key(
            { config.modkey, }, keys.restart_awesome, awesome.restart,
            { description = "restart", group = "awesome"}
        ),

        -- Client
        awful.key(
            { config.modkey, }, keys.focus_prev_client,
            function () awful.client.focus.byidx(-1) end,
            { description = "focus previous by index", group = "client" }
        ),
        awful.key(
            { config.modkey, }, keys.focus_next_client,
            function () awful.client.focus.byidx( 1) end,
            { description = "focus next by index", group = "client" }
        ),
        awful.key(
            { config.modkey, }, keys.swap_with_prev_client,
            function () awful.client.swap.byidx(-1) end,
            { description = "swap with previous client by index", group = "client" }
        ),
        awful.key(
            { config.modkey, }, keys.swap_with_next_client,
            function () awful.client.swap.byidx(1) end,
            { description = "swap with next client by index", group = "client" }
        ),
        awful.key(
            { config.modkey, }, keys.rofi_window,
            function () awful.spawn("rofi -show window") end,
            { description = "jump between clients", group = "client" }
        ),

        -- Screen
        awful.key(
            { config.modkey, }, keys.focus_prev_screen,
            function ()
                awful.screen.connect_for_each_screen(function(s)
                    s:emit_signal("changed")
                end)
                awful.screen.focus_relative(-1)
            end,
            { description = "focus the prev screen", group = "screen" }
        ),
        awful.key(
            { config.modkey, }, keys.focus_next_screen,
            function ()
                awful.screen.connect_for_each_screen(function(s)
                    s:emit_signal("changed")
                end)
                awful.screen.focus_relative(1)
            end,
            { description = "focus the next screen", group = "screen"}
        ),

        -- Layout
        awful.key(
            { config.modkey, }, keys.decrease_width,
            function () awful.tag.incmwfact(-0.05) end,
            {description = "decrease master width factor", group = "layout"}
        ),

        awful.key(
            { config.modkey, }, keys.increase_width,
            function () awful.tag.incmwfact(0.05) end,
            { description = "increase master width factor", group = "layout"}
        ),
        awful.key(
            { config.modkey, }, keys.next_layout,
            function () awful.layout.inc(1) end,
            { description = "select next", group = "layout"}
        ),

        -- Launcher
        awful.key(
            { config.modkey, }, keys.rofi_run,
            function () awful.spawn("rofi -show drun") end,
            { description = "run prompt", group = "launcher"}
        ),
        awful.key(
            { config.modkey, }, keys.open_terminal,
            function () awful.spawn(config.terminal) end,
            { description = "open a terminal", group = "launcher"}
        ),

        -- Volume
        awful.key(
            { config.modkey, }, '-',
            function () misc.audio.set_volume(-5) end,
            { description = "decrease volume", group = "volume"}
        ),
        awful.key(
            { config.modkey, }, '=',
            function () misc.audio.set_volume(5) end,
            { description = "increase volume", group = "volume"}
        ),
        awful.key(
            { config.modkey, }, '0',
            function () misc.audio.toggle_mute() end,
            { description = "toggle volume", group = "volume"}
        )
    ),
    ['client'] = awful.util.table.join(
        awful.key(
            { config.modkey }, keys.close_client,
            function (c) c:kill() end,
            { description = "close", group = "client" }
        ),
        awful.key(
            { config.modkey, }, keys.move_client_to_next_screen,
            function (c) c:move_to_screen() end,
            { description = "move client to next screen", group = "client" }
        )
    )
}

-- TODO: Is it possible to detect what interface is being used for internet?
config.network_interface = "wlo1"

-- TODO: move wibar stuff to here.
config.wibars = {
}

config.awfulrules = {
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            opacity = 1,
            keys = config.keys["client"],
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false,
            maximized_vertical = false,
            maximized_horizontal = false
        },
        {
            rule = { class = "mixxx" },
            callback = function(c)
                awful.spawn('mpc pause')
            end
        }
    }
}

config.clock_format = "%A %B %d, %I:%M%"

return config
