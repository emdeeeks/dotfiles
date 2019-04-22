local keys = require("main_keys")
local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local misc = require("misc")
local config = require("config")
local modkey = config.modkey
local terminal = config.terminal
local functions = require("functions")

require("awful.hotkeys_popup.keys")

keybindings = {}

keybindings.global = awful.util.table.join(

    --[[ Should probably hook these up to something meaningful later
    awful.key({ }, "XF86AudioPlay", function () awful.spawn("cmus-remote --pause") end),
    awful.key({ }, "XF86AudioNext", function () awful.spawn("cmus-remote --next") end),
    awful.key({ }, "XF86AudioPrev", function () awful.spawn("cmus-remote --prev") end),
    awful.key({ }, "XF86AudioRaiseVolume", function () misc.audio.set_volume(5) end),
    awful.key({ }, "XF86AudioLowerVolume", function () misc.audio.set_volume(-5) end),
    awful.key({ }, "XF86AudioMute", function () misc.audio.toggle_mute() end),
    ]]--

    -- Help
    awful.key(
        { modkey, }, keys.help,
        hotkeys_popup.show_help,
        { description = "show this help screen", group = "awesome" }
    ),
    awful.key(
        { modkey, }, keys.restart_awesome, awesome.restart,
        { description = "restart", group = "awesome"}
    ),

    -- Client
    awful.key(
        { modkey, }, keys.focus_prev_client,
        function () awful.client.focus.byidx(-1) end,
        { description = "focus previous by index", group = "client" }
    ),
    awful.key(
        { modkey, }, keys.focus_next_client,
        function () awful.client.focus.byidx( 1) end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey, }, keys.swap_with_prev_client,
        function () awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }
    ),
    awful.key(
        { modkey, }, keys.swap_with_next_client,
        function () awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }
    ),
    awful.key(
        { modkey, }, keys.rofi_window,
        function () awful.spawn("rofi -show window") end,
        { description = "jump between clients", group = "client" }
    ),

    -- Screen
    awful.key(
        { modkey, }, keys.focus_prev_screen,
        function ()
            awful.screen.connect_for_each_screen(function(s)
                beautiful.set_wallpaper(s)
            end)
            awful.screen.focus_relative(-1)
        end,
        { description = "focus the prev screen", group = "screen" }
    ),
    awful.key(
        { modkey, }, keys.focus_next_screen,
        function ()
            awful.screen.connect_for_each_screen(function(s)
                beautiful.set_wallpaper(s)
            end)
            awful.screen.focus_relative(1)
        end,
        { description = "focus the next screen", group = "screen"}
    ),

    -- Layout
    awful.key(
        { modkey, }, keys.decrease_width,
        function () awful.tag.incmwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}
    ),

    awful.key(
        { modkey, }, keys.increase_width,
        function () awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout"}
    ),
    awful.key(
        { modkey, }, keys.next_layout,
        function () awful.layout.inc(1) end,
        { description = "select next", group = "layout"}
    ),

    -- Launcher
    awful.key(
        { modkey, }, keys.rofi_run,
        function () awful.spawn("rofi -show drun") end,
        { description = "run prompt", group = "launcher"}
    ),
    awful.key(
        { modkey, }, keys.open_terminal,
        function () awful.spawn(config.terminal) end,
        { description = "open a terminal", group = "launcher"}
    )
)

for i = 1, #keys.tags do
    keybindings.global = awful.util.table.join(keybindings.global,
        awful.key({ modkey }, keys.tags[i],
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   tag:view_only()
                end
            end, {
                description = "view tag #"..i, group = "tag"
            }
        ),
        awful.key({ modkey, }, keys.above_tags[i],
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end, {
                description = "move focused client to tag #"..i, group = "tag"
            }
        )
    )
end

keybindings.client = awful.util.table.join(
    awful.key(
        { modkey }, keys.close_client,
        function (c) c:kill() end,
        { description = "close", group = "client" }
    ),
    awful.key(
        { modkey, }, keys.move_client_to_next_screen,
        function (c) c:move_to_screen() end,
        { description = "move client to next screen", group = "client" }
    )
)

root.keys(keybindings.global)

return keybindings
