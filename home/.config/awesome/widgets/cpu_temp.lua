local lain = require("lain")
local markup     = lain.util.markup
local beautiful = require("beautiful")
local gears = require("gears")

return lain.widget.temp({
	tempfile= "/sys/devices/virtual/thermal/thermal_zone1/temp",
	settings = function()
		print(gears.debug.dump(coretemp_now))
		widget:set_markup(markup(beautiful.yellow, coretemp_now .. "°C"))
	end
})
