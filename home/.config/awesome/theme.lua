local theme = {}
local naughty = require("naughty")

local cairo = require("lgi").cairo
local gears = require("gears")
local recolor_image = gears.color.recolor_image
local screen = screen
local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local theme_assets = dofile("/usr/share/awesome/themes/xresources/assets.lua")

theme.wallpaper_dir =  os.getenv("HOME") .. "/.config/awesome/assets/wallpapers"

theme.font          = "Terminus normal 10"

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

theme.divider       = theme.black

theme.bg_normal     = theme.background
theme.bg_focus      = theme.background
theme.bg_urgent     = theme.background

theme.fg_normal     = theme.foreground
theme.fg_focus      = theme.green
theme.fg_urgent     = theme.red

theme.useless_gap   = 6
theme.border_width  = 3
theme.border_normal = theme.background
theme.border_urgent = theme.red
theme.border_focus  = theme.foreground
theme.border_marked = theme.yellow

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

naughty.config.spacing = 10
naughty.config.padding = 10
naughty.config.defaults.fg              = theme.fg_normal
naughty.config.defaults.bg              = theme.bg_normal
naughty.config.defaults.margin          = 10

naughty.config.presets.success = {
    bg = theme.background,
    fg = theme.fg_focus,
}

naughty.config.presets.critical = {
    bg = theme.background,
    fg = theme.fg_urgent,
    timeout = 15,
}

theme.taglist_fg_occupied = theme.white
theme.taglist_fg_volatile = theme.yellow


--[[
naughty.config.defaults.timeout         = 10
naughty.config.defaults.screen          = math.min(screen.count(), 2)
naughty.config.defaults.position        = "top_right"
naughty.config.defaults.margin          = 30
naughty.config.defaults.width           = 400
naughty.config.defaults.gap             = 30
naughty.config.defaults.ontop           = true
naughty.config.defaults.font            = theme.font
naughty.config.defaults.icon            = nil
naughty.config.defaults.icon_size       = 16
naughty.config.defaults.fg              = theme.fg_normal
naughty.config.defaults.bg              = theme.black
naughty.config.defaults.border_color    = theme.divider
naughty.config.defaults.border_width    = 0
naughty.config.presets.low.fg           = theme.fg_minimize
naughty.config.presets.low.bg           = theme.black
naughty.config.presets.critical.fg      = theme.fg_urgent
naughty.config.presets.critical.bg      = theme.bg_urgent
naughty.config.presets.critical.timeout = 15
naughty.config.presets.critical.border_color = theme.fg_urgent
]]--


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal


-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.wallpaper = function(s)
    s = s or screen.primary
    local height = s.workarea.height
    local width = s.workarea.width
    local img = cairo.RecordingSurface(cairo.Content.COLOR,
        cairo.Rectangle { x = 0, y = 0, width = width, height = height })
    local cr = cairo.Context(img)
    cr:set_source(gears.color(theme.background))
    cr:paint()
    return img
end

theme.wallpaper = theme.wallpaper_dir .. '/wallpaper.jpg'

function set_wallpaper(s)
    if theme.wallpaper then
        local wallpaper = theme.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

awful.screen.connect_for_each_screen(set_wallpaper)

return theme
