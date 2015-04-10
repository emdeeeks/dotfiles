gears = require("gears")
vicious = require("vicious")
awful = require("awful")
awful.rules = require("awful.rules")
awful.focus = require("awful.autofocus")
lain = require("lain")
markup = lain.util.markup
wibox = require("wibox")
beautiful = require("beautiful")
naughty = require("naughty")
menubar = require("menubar")

modkey = "Mod4"
home   = os.getenv("HOME")
terminal = "gnome-terminal"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
beautiful.init(home .. "/.config/awesome/themes/default/theme.lua")

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
			text = err 
		})
		in_error = false
	end)
end

require("layouts")
require("tags")
require("awesomemenu")
require("widgets")
require("wiboxes")
require("keybindings")
require("awfulrules")
require("signals")
