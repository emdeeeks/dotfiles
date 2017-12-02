--local awful = require("awful")
--require("awful.autofocus")
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

function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
screen.connect_signal("property::geometry", set_wallpaper)

require("themes/default/layouts")
require("themes/default/tags")
require("themes/default/keybindings")
require("themes/default/mousebindings")
require("themes/default/wiboxes")
require("themes/default/signals")
require("themes/default/awfulrules")
require("themes/default/autorun")
