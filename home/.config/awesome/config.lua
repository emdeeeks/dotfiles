local puppetmaster = require("puppetmaster")
require("awful.hotkeys_popup.keys")

local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local keys = require("misc.keys")
local pomodoro = require("misc.pomodoro")
local xrandr = require("lib.xrandr")
local audio = require("misc.audio")
--local widgets = require("widgets")

local config = {}

pomodoro.start()

config.modkey = "Mod4"

config.layouts = {
    awful.layout.suit.tile.right,
    awful.layout.suit.tile.bottom,
}

--[[
-- Default terminal
]]--
config.terminal = "x-terminal-emulator"

--[[
-- Autorun apps
--
-- Hmm
]]--
config.autorun_commands = {
    'unclutter -keystroke',
    --{ 'feh ~/colemak_dh.jpg', {}, { shell = true }},
    { 'qutebrowser', {}, { once = true }},
    { 'redshift', {}, { once = true }},
    { 'google-drive-ocamlfuse ~/GoogleDrive', {}, { shell = true, once = true }},
}

--[[
TODO: Switch screens with 1, 2, 3
--]]

config.keys = {
    ['global'] = awful.util.table.join(

		awful.key({ config.modkey,           }, "space", function () awful.layout.inc(config.layouts,  1) end),

        -- Help
        awful.key(
            { config.modkey, }, keys.help,
            --puppetmaster:show_popup
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
            { description = "focus previous by index", group = "awesome:client" }
        ),
        awful.key(
            { config.modkey, }, keys.focus_next_client,
            function () awful.client.focus.byidx( 1) end,
            { description = "focus next by index", group = "awesome:client" }
        ),
        awful.key(
            { config.modkey, }, keys.swap_with_prev_client,
            function () awful.client.swap.byidx(-1) end,
            { description = "swap with previous client by index", group = "awesome:client" }
        ),
        awful.key(
            { config.modkey, }, keys.swap_with_next_client,
            function () awful.client.swap.byidx(1) end,
            { description = "swap with next client by index", group = "awesome:client" }
        ),
        awful.key(
            { config.modkey, }, keys.rofi_window,
            function () awful.spawn("rofi -show window") end,
            { description = "jump between clients", group = "awesome:client" }
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
            { description = "focus the prev screen", group = "awesome:screen" }
        ),
        awful.key(
            { config.modkey, }, keys.focus_next_screen,
            function ()
                awful.screen.connect_for_each_screen(function(s)
                    s:emit_signal("changed")
                end)
                awful.screen.focus_relative(1)
            end,
            { description = "focus the next screen", group = "awesome:screen"}
        ),

        -- Client resize
        awful.key(
            { config.modkey, "Shift" }, keys.decrease_width,
            function () awful.tag.incmwfact(-0.05) end,
            {description = "decrease master width factor", group = "awesome:client:resize"}
        ),

        awful.key(
            { config.modkey, "Shift" }, keys.increase_width,
            function () awful.tag.incmwfact(0.05) end,
            { description = "increase master width factor", group = "awesome:client:resize"}
        ),
        awful.key(
            { config.modkey, "Shift" }, keys.decrease_height,
            function () awful.client.incwfact(-0.05) end,
            {description = "decrease master height factor", group = "awesome:client:resize"}
        ),

        awful.key(
            { config.modkey, "Shift" }, keys.increase_height,
            function () awful.client.incwfact(0.05) end,
            { description = "increase master height factor", group = "awesome:client:resize"}
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
            function () audio.set_volume(-5) end,
            { description = "decrease volume", group = "volume"}
        ),
        awful.key(
            { config.modkey, }, '=',
            function () audio.set_volume(5) end,
            { description = "increase volume", group = "volume"}
        ),
        awful.key(
            { config.modkey, }, '0',
            function () audio.toggle_mute() end,
            { description = "toggle volume", group = "volume"}
        ),
        awful.key(
            { config.modkey, }, '9',
            function () end,
            { description = "toggle on-screen keyboard", group = "misc"}
        ),
        awful.key(
            { config.modkey }, '1',
            function() xrandr.xrandr() end,
            { description = "Show xrandr options", group = "misc"}
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
    ),

}

-- TODO: move wibar stuff to here.
config.wibars = {
    {
        settings = {
            position = 'top'
        },
        setup = {
            layout = wibox.layout.align.horizontal
            {
            },
            {
                layout = wibox.layout.fixed.horizontal,
            },
            {

            }
        }
    }
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
