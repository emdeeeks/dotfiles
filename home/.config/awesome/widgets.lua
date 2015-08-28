-- Make a function to loop through widgets later, changing color for each one.
-- Too lazy to do this now.
widget_colors = {
	theme.yellow,
	theme.blue,
	theme.green,
	theme.red,
	theme.cyan,
	theme.magenta
}

-- From: http://awesome.naquadah.org/wiki/Awesome_3_configuration
function execute_command(command)
   local fh = io.popen(command)
   local str = ""
   for i in fh:lines() do
      str = str .. i
   end
   io.close(fh)
   return str
end

-- Helper function to build all you need
function widget_with_timeout(command, seconds)
  local object = {}
  object.command = command
  
  object.update = function ()
    local result = execute_command(object.command)
  end

  object.timer = timer({ timeout = seconds })
--  object.timer:add_signal("timeout", object.update)
  object.timer:start()

  object.update() -- Initialize immediately
  return object
end

function widget()
	for k,v in pairs(widget_colors) do
		print('<span color"' .. k .. '">' .. v .. '</span>')
	end
end

function tasks(filter)
    taskcount = awful.util.pread('task ' .. filter .. ' count')
    return taskcount
end

taskswidget = wibox.widget.textbox()
widgetmarkup = 'Tasks: <span color="' .. theme.yellow .. '">' .. tasks('status:pending') .. '</span>'
taskswidget:set_markup(widgetmarkup)
taskswidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn_with_shell(terminal .. " -e vit") end)
))
taskswidgetTimer = timer({ timeout = 300 })
taskswidgetTimer:connect_signal("timeout",
  function()
    taskswidget:set_markup(widgetmarkup)
  end
)
taskswidgetTimer:start()

spacer = wibox.widget.textbox(markup(beautiful.black, " "))
divider = wibox.widget.textbox(markup(beautiful.divider, " : "))

systray = wibox.widget.systray()

thermalwidget  = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, '<span color="' .. theme.yellow .. '">$1°C</span>', 20, { "coretemp.0", "core"} )

memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, 'Memory: <span color="' .. theme.blue .. '">$1%</span>', 6)

netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, 'Network: <span color="' .. theme.green .. '">${eth0 down_kb} down</span> <span color="' .. theme.red .. '">${eth0 up_kb} up</span>', 3)

cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, 'Processor: <span color="' .. theme.yellow .. '">$1%</span>')
cpuwidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn_with_shell(terminal .. " -e htop") end)
))

cputempwidget = wibox.widget.textbox()
vicious.register(cputempwidget, vicious.widgets.thermal, '<span color="' .. theme.yellow .. '">$1°C</span>', 19, "thermal_zone0")

textclock = awful.widget.textclock(markup("#CC0000", '<span color="' .. theme.magenta .. '">%A %B %d, %R</span>'))

moc = wibox.widget.textbox()
moc:buttons(awful.util.table.join(
	awful.button({ }, 1, function () pause_moc() end)
))

hddwidget = wibox.widget.textbox()
vicious.register(hddwidget, vicious.widgets.fs, 'Storage: <span color="' .. theme.magenta .. '">${/ used_p}% used</span>',     599)
hddwidget:buttons(awful.util.table.join(
	awful.button({ }, 1, function () awful.util.spawn_with_shell(terminal .. " -e ranger") end)
))

batwidget = lain.widgets.bat({
	settings = function()
		widget:set_markup(
			'Battery: <span color="' .. theme.cyan .. '">' .. bat_now.perc .. '%</span>')
	end
})

yawn = lain.widgets.yawn(556053, {
	settings = function()
		widget:set_markup(
			'Weather: <span color="' .. theme.blue .. '">' .. forecast .. ' @ ' .. units .. '°C</span>'
		)
	end
})
