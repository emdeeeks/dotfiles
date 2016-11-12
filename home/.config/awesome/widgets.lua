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

--[[
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, 'Network: <span color="' .. theme.green .. '">${eth0 down_kb} down</span> <span color="' .. theme.red .. '">${eth0 up_kb} up</span>', 3)
]]--

cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, 'Processor: <span color="' .. theme.yellow .. '">$1%</span>')
cpuwidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn_with_shell(terminal .. " -e htop") end)
))

cputempwidget = wibox.widget.textbox()
vicious.register(cputempwidget, vicious.widgets.thermal, '<span color="' .. theme.yellow .. '">$1°C</span>', 19, "thermal_zone0")

textclock = awful.widget.textclock(markup(theme.fg_normal, '<span color="' .. theme.magenta .. '">%A %B %d, %R</span>'))
textclock:buttons(awful.util.table.join(
    awful.button({ }, 1, function() schedule:display()  end)
))

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
            'Battery: <span color="' .. theme.blue .. '">' .. bat_now.perc .. '%</span>'
        )
	end
})

-- Initialize widget
netwidget = wibox.widget.textbox()
-- Register widget
vicious.register(netwidget, vicious.widgets.net,
function (widget, args)

local ethdown = args["{eth0 down_kb}"]
local ethup = args["{eth0 up_kb}"]
local ethactive = (tonumber(args["{eth0 carrier}"]) == 1)
local wifidown = args["{wlan0 down_kb}"]
local wifiup = args["{wlan0 up_kb}"]
local wifiactive = (tonumber(args["{wlan0 carrier}"]) == 1)
local ssid = ''
local down = ethdown
local up = ethup
local ifname = "Wired"
if (not ethactive and wifiactive) then
    down = wifidown
    up = wifiup
    ifname = "Wifi"
    local ssid = awful.util.pread("/sbin/iwgetid -r")
    end
return string.format('%s: <span color="'..theme.yellow..'">%s</span><span color="' .. theme.green .. '">%d down</span> <span color="' .. theme.red .. '">%d up</span>', tostring(ifname), tostring(ssid), tonumber(down), tonumber(up))
end, 3)
