local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
    local tags = {}
    for i = 1, 9 do
        table.insert(tags, i)
    end
    awful.tag(
        tags
    , s, awful.layout.layouts[1])
end)
