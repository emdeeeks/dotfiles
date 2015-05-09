local theme = {}

theme.red			= "#CC6666"
theme.yellow		= "#F0C674"
theme.green			= "#B5BD68"
theme.cyan			= "#8ABEB7"
theme.blue			= "#81A2BE"
theme.magenta		= "#B294BB"
theme.dark_white	= "#969896"
theme.white			= "#EEEEEE"
theme.divider		= "#333333"
theme.black			= "#222222"

theme.font = "monospace normal 9"
theme.fg   = theme.dark_white
theme.bg   = theme.black

theme.success_fg = theme.green
theme.loaded_fg  = theme.black
theme.error_fg = theme.red
theme.error_bg = theme.black

theme.warning_fg = theme.yellow
theme.warning_bg = theme.black

theme.notif_fg = theme.cyan
theme.notif_bg = theme.black

theme.menu_fg                   = theme.black
theme.menu_bg                   = theme.dark_white
theme.menu_selected_fg          = theme.red
theme.menu_selected_bg          = theme.black
theme.menu_title_bg             = theme.black
theme.menu_primary_title_fg     = theme.red
theme.menu_secondary_title_fg   = theme.dark_white

-- Proxy manager
theme.proxy_active_menu_fg      = theme.white
theme.proxy_active_menu_bg      = theme.black
theme.proxy_inactive_menu_fg    = theme.dark_white
theme.proxy_inactive_menu_bg    = theme.black

-- Statusbar specific
theme.sbar_fg         = theme.dark_white
theme.sbar_bg         = theme.black

-- Downloadbar specific
theme.dbar_fg         = theme.dark_white
theme.dbar_bg         = theme.black
theme.dbar_error_fg   = theme.red

-- Input bar specific
theme.ibar_fg           = theme.dark_white
theme.ibar_bg           = theme.black

-- Tab label
theme.tab_fg            = theme.dark_white
theme.tab_bg            = theme.black
theme.tab_ntheme        = theme.dark_white
theme.selected_fg       = theme.green
theme.selected_bg       = theme.black
theme.selected_ntheme   = theme.dark_white
theme.loading_fg        = theme.yellow
theme.loading_bg        = theme.black

-- Trusted/untrusted ssl colours
theme.trust_fg          = theme.green
theme.notrust_fg        = theme.red

return theme
