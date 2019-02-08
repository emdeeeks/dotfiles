local awful = require("awful")
local beautiful = require("beautiful")
local config = require("config")
local modkey = config.modkey
local keys = require("main_keys")

-- TODO: Move this to keybindings
clientkeys = awful.util.table.join(
    -- TODO: Move this to something else that doesn't make my left hand move from the home row.
    awful.key({
        modkey, "Shift"   }, "c",
        function (c) c:kill() end,
        { description = "close", group = "client" }
    ),
    --[[ CHECK API FOR MOVE_TO_SCREEN()
    awful.key(
        { modkey, }, keys.move_client_to_prev_screen,
        function (c) c:move_to_screen(-1) end,
        { description = "move client to previous screen", group = "client" }
    ),
    ]]--
    awful.key(
        { modkey, }, keys.move_client_to_next_screen,
        function (c) c:move_to_screen() end,
        { description = "move client to next screen", group = "client" }
    )
)

awful.rules.rules = {
    {
        rule = { },
        properties = { 
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            opacity = 0,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false
        }
    }, {
        rule_any = { type = { 'dialog' }, role = { 'pop-up' } },
        properties = {
            floating = true,
            placement = awful.placement.centered
        }
    }, {
        rule = { class = "DDLC" },
        properties = {
            floating = true,
            sticky = true,
            below = true,
            focusable = false,
            placement = function(c)
                c:geometry(screen[1].geometry)
            end
        }
    }
}
