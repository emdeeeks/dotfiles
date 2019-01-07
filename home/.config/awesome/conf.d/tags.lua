local awful = require("awful")
local keys = require("main_keys")
local functions = require("functions")

tags = keys.home_row[1]

awful.screen.connect_for_each_screen(function(s)
    awful.tag(
        tags, s, awful.layout.layouts[1]
    )
end)
