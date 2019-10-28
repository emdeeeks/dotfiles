local awful = require("awful")
local autofocus = require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")
local home = os.getenv("HOME")
local lain = require("lain")
local config = require('config')
local gears = require("gears")
local lfs = require('lfs')
local main_dir = string.format("%s/.config/awesome/", os.getenv("HOME"))
local theme_path = main_dir .. "theme.lua"
local confd = main_dir .. 'conf.d/'
local hotkeysd = main_dir .. 'hotkeys/'
local functions = require("functions")
require("misc/print_r")
local confs = {}
local hotkeys = {}

beautiful.init(theme_path)

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

if os.getenv("ENV")=='xephyr' then
    table.insert(confs, "xephyr.lua")
end

-- hotkeys
for s in lfs.dir(hotkeysd) do
    local f = lfs.attributes(hotkeysd .. s)
    if s:sub(-4) == ".lua" and f.mode == "file" then
        table.insert(confs, hotkeysd .. s)
    end
end

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
