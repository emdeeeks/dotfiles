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

-- TODO: ADd urgent border

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

--client.connect_signal("request::urgent", function(c)
    --c.border_color = beautiful.border_urgent
--end)

screen.connect_signal("changed", function(s)
    print('screen signal changed!')
    print(awful.screen.focused().index)
    if awful.screen.focused() == s then
        print("focussed! " .. s.index)
    end
end)

awesome.connect_signal("startup", function(s)
    -- build taglist
    print('startup!')
end)

--mouse.connect_signal("property::screen", function()
    --print('screen property changed!')
    --for s in screen do
----        s.mywibox.bg = awful.screen.focused() == s and "#ff0000" or "#00ff00"
    --end
--end)

