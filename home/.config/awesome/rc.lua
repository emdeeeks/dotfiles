local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")
local home = os.getenv("HOME")
local lain = require("lain")
local gears = require("gears")

local theme_dir = string.format("%s/.config/awesome/themes/default/", home)
local theme_path = theme_dir .. "theme.lua"

terminal = "x-terminal-emulator"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

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

beautiful.init(theme_path)

local lfs = require('lfs')
local confs = {}
local confd = theme_dir .. 'conf.d/'
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
