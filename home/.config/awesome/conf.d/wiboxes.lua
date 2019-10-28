local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local home = os.getenv("HOME")
local path = home .. '/.config/awesome/conf.d/wiboxes'
local widgets = require("widgets")
--local config = require("config")
local functions = require("functions")
local space = wibox.widget.textbox(" ")

widget_list = {
    'layout = wibox.layout.fixed.horizontal',
    'widgets.cpu',
    'widgets.cpu_temp'
}

awful.screen.connect_for_each_screen(function(s)
    --[[
        for k,bar in pairs(config.wibars) do
            s.bar = awful.wibar(bar['settings'])
            --s.bar:setup(bar['setup'])
        end
    ]]--

    s.bottomwibox = awful.wibar({
        position = "bottom",
        screen = s,
        height = 40,
    })

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"
    s.bottomwibox:setup {
        layout = wiboxlayout,
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.taglist(s)
            --s.mytaglist,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            --widgets.get(widget_list),
            widgets.cpu,
            space,
            widgets.cpu_temp,
            space,
            widgets.mem,
            space,
            --widgets.fs,
            --space,
            widgets.bat,
            space,
            widgets.net,
            space,
            widgets.btc,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.clock
        },
    }
end)
