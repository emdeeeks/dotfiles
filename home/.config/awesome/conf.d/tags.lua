local awful = require("awful")
local tags = require("config").get("tags")

awful.screen.connect_for_each_screen(function(s)
    awful.tag(
        tags, s, awful.layout.layouts[1]
    )
end)
