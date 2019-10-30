local wibox = require("wibox")
local config = require("config")

return wibox.container.margin(
    wibox.widget.textclock(config.clock_format), 10, 10, 10, 10
)
