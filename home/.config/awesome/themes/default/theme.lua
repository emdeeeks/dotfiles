theme = {}
theme.font          = "Terminus normal 10"
theme.img_dir 		= home .. "/.config/awesome/themes/default/img"

theme.wallpaper =  theme.img_dir .. "/wallpapers/2.jpg"

theme.red			= "#CC6666"
theme.yellow		= "#F0C674"
theme.green			= "#B5BD68"
theme.cyan			= "#8ABEB7"
theme.blue			= "#81A2BE"
theme.magenta		= "#B294BB"
theme.dark_white 	= "#969896"
theme.white 		= "#EEEEEE"
theme.divider		= "#333333"
theme.black			= "#222222"

theme.useless_gap_width = 15

theme.bg_normal     = theme.black
theme.bg_focus      = theme.black
theme.bg_urgent     = theme.black
theme.bg_minimize   = theme.black

theme.fg_normal     = theme.white
theme.fg_focus      = theme.green
theme.fg_urgent     = theme.red
theme.fg_minimize   = theme.dark_white

theme.border_width  = "3"
theme.border_normal = theme.black
theme.border_focus  = theme.green

naughty.config.defaults.timeout          = 5
naughty.config.defaults.screen           = 2
naughty.config.defaults.position         = "top_right"
naughty.config.defaults.margin           = 10
naughty.config.defaults.width            = 400
naughty.config.defaults.gap              = 10
naughty.config.defaults.ontop            = true
naughty.config.defaults.font             = theme.font
naughty.config.defaults.icon             = nil
naughty.config.defaults.icon_size        = 16
naughty.config.defaults.fg               = theme.fg_focus
naughty.config.defaults.bg               = theme.bg_focus
naughty.config.defaults.border_color     = theme.divider
naughty.config.defaults.border_width     = 2
naughty.config.defaults.hover_timeout    = nil
naughty.config.presets.normal.fg      = theme.white
naughty.config.presets.normal.bg      = theme.black
naughty.config.presets.normal.timeout = 10
naughty.config.presets.critical.fg		 = theme.fg_urgent
naughty.config.presets.critical.bg		 = theme.black
naughty.config.presets.critical.timeout		 = 15

theme.icon_theme = nil
theme.taglist_squares_sel   	= theme.img_dir .. "/taglist/taglist_squarefw.png"
theme.taglist_squares_unsel 	= theme.img_dir .. "/taglist/taglist_squarew.png"
theme.tasklist_floating_icon 	= theme.img_dir .. "/floatingw.png"

theme.menu_submenu_icon = theme.img_dir .. "/submenu.png"
theme.menu_height 		= "15"
theme.menu_width  		= "150"

theme.layout_fairh 		= theme.img_dir .. "/layouts/fairh.png"
theme.layout_fairv 		= theme.img_dir .. "/layouts/fairv.png"
theme.layout_floating  	= theme.img_dir .. "/layouts/floating.png"
theme.layout_magnifier 	= theme.img_dir .. "/layouts/magnifier.png"
theme.layout_max 		= theme.img_dir .. "/layouts/max.png"
theme.layout_fullscreen = theme.img_dir .. "/layouts/fullscreen.png"
theme.layout_tilebottom = theme.img_dir .. "/layouts/tilebottom.png"
theme.layout_tileleft   = theme.img_dir .. "/layouts/tileleft.png"
theme.layout_tile 		= theme.img_dir .. "/layouts/tile.png"
theme.layout_tiletop 	= theme.img_dir .. "/layouts/tiletop.png"
theme.layout_spiral  	= theme.img_dir .. "/layouts/spiral.png"
theme.layout_dwindle 	= theme.img_dir .. "/layouts/dwindle.png"

if theme.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(theme.wallpaper, s, true)
    end
end

theme.lain_icons         = os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/default/"
theme.layout_termfair    = theme.lain_icons .. "termfairw.png"
theme.layout_cascade     = theme.lain_icons .. "cascadew.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetilew.png"
theme.layout_centerwork  = theme.lain_icons .. "centerworkw.png"

return theme
