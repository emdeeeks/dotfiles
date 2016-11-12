pomodoro = {}
pomodoro.pause_duration = 5 * 60
pomodoro.work_duration = 25 * 60
pomodoro.long_pause_duration = 30 * 60

pomodoro.pause_title = "Pause finished."
pomodoro.pause_text = "Get back to work!"
pomodoro.work_title = "Pomodoro finished."
pomodoro.work_text = "Time for a pause!"
pomodoro.working = true
pomodoro.left = pomodoro.work_duration
pomodoro.widget = wibox.widget.textbox()
pomodoro.widget.markup = 'Pomodoro Start'
pomodoro.widget:set_markup(pomodoro.widget.markup)

pomodoro.timer = timer { timeout = 1 }

function pomodoro:settime(t)
  if t >= 3600 then -- more than one hour!
    t = os.date("!%X", t-3600)
  else
    t = os.date("!%M:%S", t)
  end

  pomodoro.widget:set_markup(string.format("Pomodoro: <span color='" .. theme.red .. "'>%s</span>", t))
end

function pomodoro:notify(title, text, duration, working)
  naughty.notify {
    title = title,
    text = text,
  }

  pomodoro.left = duration
  pomodoro:settime(duration)
  pomodoro.working = working
end

pomodoro:settime(pomodoro.work_duration)

pomodoro.widget:buttons(
  awful.util.table.join(
    awful.button({ }, 1, function()
      pomodoro.last_time = os.time()
      pomodoro.timer:start()
    end),
    awful.button({ }, 2, function()
      pomodoro.timer:stop()
    end),
    awful.button({ }, 3, function()
      pomodoro.timer:stop()
      pomodoro.left = pomodoro.work_duration
      pomodoro:settime(pomodoro.work_duration)
    end)
))

pomodoro.timer:connect_signal("timeout", function()
  local now = os.time()
  pomodoro.left = pomodoro.left - (now - pomodoro.last_time)
  pomodoro.last_time = now

  if pomodoro.left > 0 then
    pomodoro:settime(pomodoro.left)
  else
    if pomodoro.working then
      pomodoro:notify(pomodoro.work_title, pomodoro.work_text,
        pomodoro.pause_duration, false)
    else
      pomodoro:notify(pomodoro.pause_title, pomodoro.pause_text,
        pomodoro.work_duration, true)
    end
    pomodoro.timer:stop()
  end
end)
