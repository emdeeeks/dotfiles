local awful = require("awful")
local beautiful = require("beautiful")

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

screen.connect_signal("changed", function(s)
    -- TODO: Set focussed screen wallpaper color to 'selected'
end)
