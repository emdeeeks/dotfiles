local lain = require("lain")
local markup     = lain.util.markup
local beautiful = require("beautiful")

return lain.widget.cpu({
    settings = function()
        widget:set_markup("Cpu " .. markup(beautiful.yellow, cpu_now.usage .. "%"))
    end
})
