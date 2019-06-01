local theme = {}
local naughty = require("naughty")

local cairo = require("lgi").cairo
local functions = require("functions")
local gears = require("gears")
local recolor_image = gears.color.recolor_image
local screen = screen
local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

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

theme.divider       = theme.black

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

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.hotkeys_font = theme.font
theme.hotkeys_description_font = theme.font

naughty.config.spacing = theme.padding
naughty.config.padding = theme.padding
naughty.config.defaults.fg              = theme.fg_normal
naughty.config.defaults.bg              = theme.bg_normal
naughty.config.defaults.margin          = theme.padding

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

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal
theme.icon_theme = nil

theme.wallpaper = function(s)
    s = s or screen.primary
    local height = s.workarea.height
    local width = s.workarea.width
    local img = cairo.RecordingSurface(cairo.Content.COLOR,
        cairo.Rectangle { x = 0, y = 0, width = width, height = height })
    local cr = cairo.Context(img)
    bg_color = theme.black
    if s.index == awful.screen.focused().index then
        bg_color = theme.background
    end
    cr:set_source(gears.color(bg_color))
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

awful.screen.connect_for_each_screen(theme.set_wallpaper)

return theme

-- if awesome.composite_manager_running then
  -- theme.titlebar_bg_normal = theme.titlebar_bg_normal .."66"
  -- theme.border_normal       = theme.border_normal .."66"
  -- theme.border_focus        = theme.border_focus .."66"
  -- theme.titlebar_bg_normal  = theme.titlebar_bg_normal.."dd"
  -- theme.actionless_titlebar_bg_normal = theme.titlebar_bg_normal.."dd"
  -- theme.actionless_titlebar_bg_normal = theme.titlebar_bg_normal.."66"
  -- theme.titlebar_bg_focus   = theme.titlebar_bg_focus.."dd"
  -- theme.actionless_titlebar_bg_focus  = theme.titlebar_bg_focus.."dd"
-- end
