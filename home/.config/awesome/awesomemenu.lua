local menubar = require("menubar")

require('freedesktop.utils')
require('freedesktop.menu')
freedesktop.utils.icon_theme = 'gnome'

require("debian.menu")

appsmenu = awful.menu({
	width = 250,
	coords={x=1, y=1},
	items = freedesktop.menu.new()
	--items = debian.menu.Debian_menu.Debian
})

awesomemenu = awful.menu({
	width = 250,
	coords={x=1, y=1},
	items = {
		{ "manual", terminal .. " -e 'man awesome'" },
		{ "edit config", editor_cmd .. " " .. awesome.conffile },
		{ "view live config", "sh " .. home .. "/dotfiles/home/.config/awesome/scripts/debug-awesome.sh" },
		{ "restart", awesome.restart },
		{ "quit", awesome.quit }
	}
})

launcher = wibox.widget.textbox('MENU')

launcher:buttons(awful.util.table.join(
	awful.button({ }, 1, function() appsmenu:toggle()  end),
	awful.button({ }, 3, function() awesomemenu:toggle()  end)
))

menubar.utils.terminal = terminal -- Set the terminal for applications that require it
