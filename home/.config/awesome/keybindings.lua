local config = require("config")
local awful = require("awful")
local keys = require("main_keys")
local functions = require("functions")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful")
local modkey = config.modkey
keybindings = {}

--[[
Should be able to do something like this,

for k,v in pairs(config.keys) do
    for k2,v2 in pairs(v) do
        table.insert(bindings[k], awful.key(functions.explode(v2)))
    end
end
]]--

keybindings.global = awful.util.table.join(

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
                beautiful.set_wallpaper(s)
            end)
            awful.screen.focus_relative(-1)
        end,
        { description = "focus the prev screen", group = "screen" }
    ),
    awful.key(
        { config.modkey, }, keys.focus_next_screen,
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
)

for i = 1, #keys.tags do
    keybindings.global = awful.util.table.join(keybindings.global,
        awful.key({ config.modkey }, keys.tags[i],
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
        awful.key({ config.modkey, }, keys.above_tags[i],
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

root.keys(keybindings.global)

return keybindings
