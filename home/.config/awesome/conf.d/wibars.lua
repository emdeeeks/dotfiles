local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local home = os.getenv("HOME")
local path = home .. '/.config/awesome/conf.d/'
local widgets = require("widgets")
local gears = require("gears")
local config = require("config")

awful.screen.connect_for_each_screen(function(s)
    --[[
    -- TODO: See if something like this is possible
        for k,bar in pairs(config.wibars) do
            s.bar = awful.wibar(bar['settings'])
            s.bar:setup(bar['setup'])
        end
    ]]--

    s.wibar = awful.wibar({
        position = "bottom",
        screen = s,
        height = 40,
    })

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"
    s.wibar:setup {
        layout = wiboxlayout,
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.taglist(s)
        },
        {
            layout = wibox.layout.fixed.horizontal,
            s.index == screen.count() and widgets.cpu,
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.cpu_temp,
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.mem,
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.bat,
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.net,
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.volume,
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.btc,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.clock
        },
    }
end)
