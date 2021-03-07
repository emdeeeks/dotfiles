local main_dir = string.format("%s/.config/awesome/", os.getenv("HOME"))
local lib_dir = main_dir ..  'lib/'
package.path = lib_dir .. "?.lua;" .. package.path
package.path = lib_dir .. "?/init.lua;" .. package.path

local widgetsd = main_dir .. 'widgets.d/'
local awful = require("awful")
local autofocus = require("awful.autofocus")
local theme = require("theme")
local naughty = require("naughty")
--nlocal config = require('config')
local lfs = require('lfs')
local confd = main_dir .. 'conf.d/'
local hotkeysd = main_dir .. 'hotkeys.d/'
local confs = {}
--local trinkets = require("trinkets")
require("awful.hotkeys_popup.keys")
widgets = {}
local gears = require("gears")

--local geo = screen[1].geometry
--local new_width = math.ceil(geo.width/2)
--local new_width2 = geo.width - new_width
--screen[1]:fake_resize(geo.x, geo.y, new_width, geo.height)
--screen.fake_add(geo.x + new_width, geo.y, new_width2, geo.height)

--awful.screen.connect_for_each_screen(function(s)
--end)

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end

-- hotkeys
for s in lfs.dir(hotkeysd) do
    local f = lfs.attributes(hotkeysd .. s)
    if s:sub(-4) == ".lua" and f.mode == "file" then
        table.insert(confs, hotkeysd .. s)
    end
end

-- TODO: Make a convenience method for this
-- confs
for s in lfs.dir(confd) do
    local f = lfs.attributes(confd .. s)
    if s:sub(-4) == ".lua" and f.mode == "file" then
        table.insert(confs, confd .. s)
    end
end
table.sort(confs)
for i,conf in pairs(confs) do
    local config = awful.util.checkfile(conf)
    if type(config) == 'function' then
        config()
    else
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = string.format('Skipping %s due to error: %s', conf, config)
        })
    end
end


