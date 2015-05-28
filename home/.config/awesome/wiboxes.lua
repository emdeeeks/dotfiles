topwibox = {}
bottomwibox = {}
promptbox = {}
layoutbox = {}
taglist = {}
taglist.buttons = awful.util.table.join(
	awful.button({ }, 1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, awful.client.toggletag),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
)

tasklist = {}
tasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c.minimized = false
		if not c:isvisible() then
			awful.tag.viewonly(c:tags()[1])
		end
		client.focus = c
		c:raise()
		end
	end)
)

for s = 1, screen.count() do
	awful.screen.padding( screen[s], { bottom = 12, top = 12, left = 12, right = 12} )

    -- Create a promptbox for each screen
	promptbox[s] = awful.widget.prompt()

	layoutbox[s] = awful.widget.layoutbox(s)
	layoutbox[s]:buttons(
		awful.util.table.join(
			awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
			awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
			awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
			awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
		)
	)

	taglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist.buttons)
	tasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist.buttons)

	topwibox[s] = awful.wibox({ position = "top", screen = s, height = 22 })
	--topwibox[s]:set_bg(beautiful.taglist_bg_focus)

	local left_layout = wibox.layout.fixed.horizontal()
	left_layout:add(spacer)
	left_layout:add(launcher)
	left_layout:add(spacer)
	left_layout:add(taglist[s])
	left_layout:add(spacer)
	left_layout:add(promptbox[s])

	local right_layout = wibox.layout.fixed.horizontal()
	--if s == 1 then right_layout:add(wibox.widget.systray()) end
	right_layout:add(spacer)
	right_layout:add(textclock)
	right_layout:add(spacer)
	right_layout:add(layoutbox[s])

	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_middle(tasklist[s])
	layout:set_right(right_layout)

	topwibox[s]:set_widget(layout)

	bottomwibox[s] = awful.wibox({ position = "bottom", screen = s, height = 22 })

	local left_layout = wibox.layout.fixed.horizontal()
	left_layout:add(spacer)
	left_layout:add(cpuwidget)
	left_layout:add(spacer)
	left_layout:add(cputempwidget)
	left_layout:add(divider)
	left_layout:add(memwidget)
	left_layout:add(divider)
	left_layout:add(netwidget)
	left_layout:add(divider)
	left_layout:add(batwidget)
	left_layout:add(divider)
	left_layout:add(hddwidget)
	left_layout:add(divider)
	left_layout:add(yawn.widget)
	left_layout:add(divider)
	left_layout:add(taskswidget)

	local right_layout = wibox.layout.fixed.horizontal()
	right_layout:add(moc)
	right_layout:add(spacer)

	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_middle(middle_layout)
	layout:set_right(right_layout)

	bottomwibox[s]:set_widget(layout)
end
