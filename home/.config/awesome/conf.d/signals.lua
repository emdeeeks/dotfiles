local awful = require("awful")
local beautiful = require("beautiful")

client.connect_signal("manage", function (c, startup)
    if not startup then
        awful.client.setslave(c)
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

screen.connect_signal("changed", function(s)
    -- TODO: Set focussed screen wallpaper color to 'selected'
end)
