local lain = require("lain")
local markup     = lain.util.markup
local beautiful = require("beautiful")

return lain.widget.bat({
    settings = function()
        color = beautiful.cyan
        if bat_now.status == 'Charging' then
            color = beautiful.green
        end
        widget:set_markup("Bat " .. markup(color, bat_now.perc .. "%"))
    end
})
