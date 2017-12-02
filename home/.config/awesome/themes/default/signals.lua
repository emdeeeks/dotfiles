local awful = require("awful")
local beautiful = require("beautiful")

client.connect_signal("unmanage", function() focus_on_last_in_history(mouse.screen) end)

function focus_on_last_in_history( screen )
  local c = awful.client.focus.history.get(screen, 0)
  if not (c == nil) then
    client.focus = c
    c:raise()
  end
end

client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)


client.connect_signal("focus",
    function(c)
        if c.maximized then -- no borders if only 1 client visible
            c.border_width = 0
        elseif #awful.screen.focused().clients > 1 then
            c.border_width = beautiful.border_width
            c.border_color = beautiful.border_focus
        end
    end
)

tag.connect_signal("property::selected", function() focus_on_last_in_history(mouse.screen) end)

client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
