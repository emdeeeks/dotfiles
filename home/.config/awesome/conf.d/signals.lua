local awful = require("awful")
local beautiful = require("beautiful")

client.connect_signal("focus", function(c)
    if c.maximized then -- no borders if only 1 client visible
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end)

client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
