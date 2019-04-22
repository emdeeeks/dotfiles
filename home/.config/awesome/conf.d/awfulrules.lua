local awful = require("awful")
local beautiful = require("beautiful")
local keybindings = require("keybindings")

awful.rules.rules = {
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
            rule = { class = "dosbox" },
            callback = function(c)
                awful.spawn('mpc pause')
            end
        }
    }
}
