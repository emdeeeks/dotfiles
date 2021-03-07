local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")

taglist = function(screen)
    return wibox.container.margin(
        awful.widget.taglist(screen, awful.widget.taglist.filter.all),
        0, 0, beautiful.padding, beautiful.padding
    )
end

return taglist
