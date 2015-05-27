timermoc = timer { timeout = 2 }
timermoc:connect_signal("timeout", function() hook_moc() end)
timermoc:start()

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
      -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)
  

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- No border for maximized clients
client.connect_signal("focus",
    function(c)
        if c.maximized_horizontal == true and c.maximized_vertical == true then
            c.border_color = beautiful.border_normal
        else
            c.border_color = beautiful.border_focus
        end
    end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Arrange signal handler
for s = 1, screen.count() do screen[s]:connect_signal("arrange", function ()
        local clients = awful.client.visible(s)
        local layout  = awful.layout.getname(awful.layout.get(s))

        if #clients > 0 then -- Fine grained borders and floaters control
            for _, c in pairs(clients) do -- Floaters always have borders
                if awful.client.floating.get(c) or layout == "floating" then
                    c.border_width = beautiful.border_width

                -- No borders with only one visible client
                elseif #clients == 1 or layout == "max" then
                    clients[1].border_width = 0
                else
                    c.border_width = beautiful.border_width
                end
            end
        end
      end)
end
-- }}}

function hook_moc()
    moc_info = io.popen("mocp -i"):read("*all")
	
	if (string.len(moc_info) == 0) then 
      return 
    end
	
	moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
    if moc_state == "PLAY" or moc_state == "PAUSE" then
        moc_file = string.gsub(string.match(moc_info, "File: %C*"), "File: ","")
		moc_artist = string.gsub(string.match(moc_info, "Artist: %C*"), "Artist: ","")
        moc_title = string.gsub(string.match(moc_info, "SongTitle: %C*"), "SongTitle: ","")
        moc_curtime = string.gsub(string.match(moc_info, "CurrentTime: %d*:%d*"), "CurrentTime: ","")
        moc_totaltime = string.gsub(string.match(moc_info, "TotalTime: %d*:%d*"), "TotalTime: ","")
        if moc_artist == "" or moc_title == "" then 
            moc_artist = moc_file
        end

		moc_string = '<span color="' .. theme.magenta.. '">' .. moc_artist .. '</span> - <span color="' .. theme.yellow .. '">' .. moc_title .. '</span>'
        if moc_state == "PLAY" then 
            moc_string = 'Playing: ' .. moc_string
        elseif moc_state == "PAUSE" then 
            moc_string = '<span color="' .. theme.red .. '">Paused:</span> ' .. moc_string
        end
    else
        return
    end
	
	moc_string = moc_string:gsub("&", "")

    moc:set_markup(moc_string)
end

function pause_moc()
    moc_info = io.popen("mocp -i"):read("*all")
    moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
    if moc_state == "PLAY" then
        io.popen("mocp -P")
    elseif moc_state == "PAUSE" then
        io.popen("mocp -U")
    end
end
