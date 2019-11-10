local awful = require("awful")
local keys = require("misc.keys")

awful.screen.connect_for_each_screen(function(s)
    awful.tag(
        keys.tags, s, awful.layout.layouts[1]
    )
end)
