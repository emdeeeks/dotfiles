awful.rules.rules = {
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = true,
			keys = clientkeys,
			buttons = clientbuttons,
            size_hints_honor = false	
	    }
	},
	{
		rule = { class = "gimp" },
		properties = { floating = true }
	},
	{
		rule = { class = "luakit" },
--		tag = tags[screen.count()][1]
	},
	{
		rule = { class = "evolution" },
--		tag = tags[screen.count()][2]
	},
	{
		rule = { class = "skype" },
--		tag = tags[screen.count()][3],
		properties = { floating = true }
	},
}
