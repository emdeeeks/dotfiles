local awful = require("awful")
local keys = require("main_keys")
local functions = require("functions")

awful.screen.connect_for_each_screen(function(s)
    awful.tag(
        keys.tags, s, awful.layout.layouts[1]
    )
end)
