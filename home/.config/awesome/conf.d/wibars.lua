--[[
    TODO: Find screen resolutions and hide wibar elements
    for certain viewports.
--]]

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local home = os.getenv("HOME")
local path = home .. '/.config/awesome/conf.d/'
local widgets = require("widgets")

local config = require("config")
local php = require("misc.lua_php_utils")

awful.screen.connect_for_each_screen(function(s)
    --for k,bar in pairs(config.wibars) do
        --s.bar = awful.wibar(bar['settings'])
        --s.bar:setup(bar['setup'])
    --end

    s.wibar = awful.wibar({
        position = "bottom",
        screen = s,
        height = 40,
    })

    widgets.testies = wibox.widget.textbox("1")
    widgets.testies2 = wibox.widget.textbox("2")
    widgets.testies3 = wibox.widget.textbox("3")

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"
    s.wibar:setup {
        layout = wiboxlayout,
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.spacer,
            widgets.screen(s.index),
            widgets.spacer,
            widgets.taglist(s),
            --require('widgets.goal')('wooo')
            --widgets.goal('wooo')
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
--            s.index == screen.count() and widgets.volume,
--            s.index == screen.count() and widgets.spacer,
--            s.index == screen.count() and widgets.wolume,
            s.index == screen.count() and widgets.spacer,
--            s.index == screen.count() and widgets.coinmarketcap('bitcoin'),
            s.index == screen.count() and widgets.spacer,
            s.index == screen.count() and widgets.pomodoro
        },
        {
            layout = wibox.layout.fixed.horizontal,
            s.index == screen.count() and widgets.clock
        },
    }
end)
