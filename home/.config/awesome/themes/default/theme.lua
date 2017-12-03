local theme = {}
local naughty = require("naughty")

local cairo = require("lgi").cairo
local gears = require("gears")
local recolor_image = gears.color.recolor_image
local screen = screen
local awful = require("awful")

local theme_assets = dofile("/usr/share/awesome/themes/xresources/assets.lua")

theme.img_dir =  os.getenv("HOME") .. "/.config/awesome/themes/default/img"

theme.font          = "Terminus normal 10"

theme.red           = "#CC6666"
theme.yellow        = "#F0C674"
theme.green         = "#B5BD68"
theme.cyan          = "#8ABEB7"
theme.blue          = "#81A2BE"
theme.magenta       = "#B294BB"
theme.gray          = "#888888"
theme.white         = "#EEEEEE"
theme.divider       = "#333333"
theme.black         = "#222222"

theme.bg_normal     = theme.black
theme.bg_focus      = theme.black
theme.bg_urgent     = theme.black
theme.bg_minimize   = theme.black
theme.bg_systray    = theme.black

theme.fg_normal     = theme.gray
theme.fg_focus      = theme.green
theme.fg_urgent     = theme.red
theme.fg_minimize   = theme.yellow

theme.useless_gap   = 5
theme.border_width  = 1
theme.border_normal = theme.black
theme.border_urgent = theme.red
theme.border_focus  = theme.green
theme.border_marked = theme.yellow

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.layout_fairh      = theme.img_dir .. "/layouts/fairh.png"
theme.layout_fairv      = theme.img_dir .. "/layouts/fairv.png"
theme.layout_floating   = theme.img_dir .. "/layouts/floating.png"
theme.layout_magnifier  = theme.img_dir .. "/layouts/magnifier.png"
theme.layout_max        = theme.img_dir .. "/layouts/max.png"
theme.layout_fullscreen = theme.img_dir .. "/layouts/fullscreen.png"
theme.layout_tilebottom = theme.img_dir .. "/layouts/tilebottom.png"
theme.layout_tileleft   = theme.img_dir .. "/layouts/tileleft.png"
theme.layout_tile       = theme.img_dir .. "/layouts/tile.png"
theme.layout_tiletop    = theme.img_dir .. "/layouts/tiletop.png"
theme.layout_spiral     = theme.img_dir .. "/layouts/spiral.png"
theme.layout_dwindle    = theme.img_dir .. "/layouts/dwindle.png"
theme.layout_work       = theme.img_dir .. "/layouts/work.png"

naughty.config.defaults.fg              = theme.bg_normal
naughty.config.defaults.bg              = theme.fg_normal
naughty.config.defaults.margin = 10

naughty.config.presets.critical.fg      = theme.fg_urgent
naughty.config.presets.critical.bg      = theme.black
naughty.config.presets.critical.timeout = 15
naughty.config.presets.critical.border_color = theme.fg_urgent

naughty.config.spacing = 10
naughty.config.padding = 10



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
naughty.config.defaults.border_width    = 2
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

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 16
theme.menu_width  = 100

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
    cr:set_source(gears.color(theme.divider))
    cr:paint()
    return img
end

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
