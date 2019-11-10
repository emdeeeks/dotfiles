local print_r = require("misc/print_r")
local naughty = require("naughty")
local cairo = require("lgi").cairo
local gears = require("gears")
local screen = screen
local awful = require("awful")
local beautiful = require("beautiful")
local xrdb = require("beautiful.xresources").get_current_theme()

local theme = {}

theme.font          = "Terminus normal 10"

theme.padding       = 10

theme.foreground    = xrdb.foreground
theme.background    = xrdb.background

theme.black         = xrdb.color0
theme.red           = xrdb.color1
theme.green         = xrdb.color2
theme.yellow        = xrdb.color3
theme.blue          = xrdb.color4
theme.magenta       = xrdb.color5
theme.cyan          = xrdb.color6
theme.white         = xrdb.color7

theme.bg_normal     = theme.background
theme.bg_focus      = theme.background
theme.bg_urgent     = theme.background

theme.fg_normal     = theme.foreground
theme.fg_focus      = theme.green
theme.fg_urgent     = theme.red

theme.border_width  = 3
theme.useless_gap   = 0
theme.border_normal = theme.background
theme.border_urgent = theme.red
theme.border_focus  = theme.foreground
theme.border_marked = theme.yellow

theme.hotkeys_font = theme.font
theme.hotkeys_description_font = theme.font

naughty.config.spacing = theme.padding
naughty.config.padding = theme.padding
naughty.config.defaults.fg              = theme.fg_normal
naughty.config.defaults.bg              = theme.bg_normal
naughty.config.defaults.margin          = theme.padding
naughty.config.defaults.timeout = 400

naughty.config.presets.success = {
    bg = theme.background,
    fg = theme.fg_focus,
}

naughty.config.presets.critical = {
    bg = theme.background,
    fg = theme.fg_urgent,
}

theme.taglist_fg_occupied = theme.white

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal
theme.icon_theme = nil

--[[
--TODO: This currently doesn't work! Fix it.
--Doesn't grab the correct screen index
]]--
theme.wallpaper = function(s)
    s = s or screen.primary
    local height = s.workarea.height
    local width = s.workarea.width
    local img = cairo.RecordingSurface(cairo.Content.COLOR,
        cairo.Rectangle { x = 0, y = 0, width = width, height = height })
    local cr = cairo.Context(img)
    local color = theme.background
    if s == awful.screen.focused() then
        local color = theme.yellow
    end
    cr:set_source(gears.color(color))
    cr:paint()
    return img
end

function theme.set_wallpaper(s)
    if theme.wallpaper then
        local wallpaper = theme.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

awful.screen.focus(screen[screen.count()])
awful.screen.connect_for_each_screen(theme.set_wallpaper)

beautiful.init(theme)
