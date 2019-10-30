local lain = require("lain")
local markup     = lain.util.markup
local beautiful = require("beautiful")

return lain.widget.temp({
    settings = function()
        widget:set_markup(markup(beautiful.yellow, coretemp_now .. "°C"))
    end
})
