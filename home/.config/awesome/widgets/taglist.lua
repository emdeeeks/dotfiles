local lain = require("lain")
local markup = lain.util.markup
local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")

taglist = function(screen)
    return wibox.container.margin(
        awful.widget.taglist(screen, awful.widget.taglist.filter.all),
        10, 10, 10,10
    )
end

return taglist
