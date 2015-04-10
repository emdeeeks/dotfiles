awful.rules.rules = {
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = true,
			keys = clientkeys,
			buttons = clientbuttons
		}
	},
	{
		rule = { class = "gimp" },
		properties = { floating = true }
	},
	{
		rule = { class = "luakit" },
--		tag = tags[2][1]
    },
    {
		rule = { class = "evolution" },
--		tag = tags[2][2]
    },
    {
		rule = { class = "skype" },
--		tag = tags[2][3]
    },
}
