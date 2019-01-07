local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local misc = require("misc")
local config = require("config")
local modkey = config.get('modkey')
local alt_modkey = config.get('alt_modkey')
local terminal = config.get('terminal')
local keys = require("main_keys")

require("awful.hotkeys_popup.keys")

KEY_OTHER_SCREEN = 'o'

local keyboard_variant = io.popen("setxkbmap -query|grep 'variant'|awk '{print $2}'")
if keyboard_variant:read() == 'colemak' then
    KEY_OTHER_SCREEN = 'y'
end

globalkeys = awful.util.table.join(

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
        { modkey, }, "s",
        hotkeys_popup.show_help,
        { description = "show this help screen", group = "awesome" }
    ),
    awful.key(
        { modkey, "Shift" }, "r", awesome.restart,
        { description = "restart", group = "awesome"}
    ),

    -- Client
    awful.key(
        { modkey, }, keys.KEY_DOWN,
        function () awful.client.focus.byidx( 1) end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey, }, keys.KEY_UP,
        function () awful.client.focus.byidx(-1) end,
        { description = "focus previous by index", group = "client" }
    ),
    -- TODO: Move this to something better
    awful.key(
        { modkey, "Shift" }, keys.KEY_DOWN,
        function () awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }
    ),
    -- TODO: Move this to something better
    awful.key(
        { modkey, "Shift" }, keys.KEY_UP,
        function () awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }
    ),
    awful.key(
        { modkey, }, KEY_OTHER_SCREEN, 
        awful.client.movetoscreen,
        { description = "move client to other screen", group = "client" }
    ),
    awful.key({ modkey, }, "u",
        awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client"}
    ),
    awful.key(
        { modkey, }, "w",
        function () awful.spawn("rofi -show window") end,
        { description = "jump between clients", group = "client" }
    ),

    -- Screen
    awful.key(
        { modkey, }, '[',
        function () 
            awful.screen.focus_relative(1)
        end,
        { description = "focus the next screen", group = "screen" }
    ),
    awful.key(
        { modkey, }, ']',
        function ()
            awful.screen.focus_relative(-1)
        end,
        { description = "focus the previous screen", group = "screen"}
    ),

    -- Layout
    awful.key(
        { modkey, }, keys.KEY_RIGHT,
        function () awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout"}
    ),
    awful.key(
        { modkey, }, keysRKEY_LEFT,
        function () awful.tag.incmwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}
    ),
    awful.key(
        { modkey, }, "space",
        function () awful.layout.inc(1) end,
        { description = "select next", group = "layout"}
    ),

    -- Launcher
    awful.key(
        { modkey, }, "r",
        function () awful.spawn("rofi -show drun") end,
        { description = "run prompt", group = "launcher"}
    ),
    awful.key(
        { modkey, }, "Return",
        function () awful.spawn(config.get('terminal')) end,
        { description = "open a terminal", group = "launcher"}
    )
)

for i = 1, #keys.home_row[1] do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ alt_modkey }, keys.home_row[1][i],
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
        awful.key({ alt_modkey, "Shift" }, keys.home_row[1][i],
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

root.keys(globalkeys)
