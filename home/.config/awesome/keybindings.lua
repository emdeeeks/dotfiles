globalkeys = awful.util.table.join(
    awful.key({ }, "XF86AudioPlay", function () awful.util.spawn("mocp --toggle-pause") end),
    awful.key({ }, "XF86AudioNext", function () awful.util.spawn("mocp --next") end),
    awful.key({ }, "XF86AudioPrev", function () awful.util.spawn("mocp --prev") end),
    awful.key({ }, "XF86AudioRaiseVolume", function ()
        awful.util.spawn("amixer -D pulse sset Master 5%+")
    end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
        awful.util.spawn("amixer -D pulse sset Master 5%-")
    end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("amixer -D pulse sset Master toggle") end),
    awful.key({ modkey }, "XF86Eject", function () awful.util.spawn("save-screenshot") end),
    awful.key({ modkey, 'Ctrl' }, "XF86Eject", function () awful.util.spawn("imgur-screenshot") end),

    awful.key({ modkey, 'Shift'}, "F1", keydoc.display),

    keydoc.group("Screen Focussing"),
    awful.key({modkey,            }, "F1",     function () awful.screen.focus(2) end, 'Focus first screen'),
    awful.key({modkey,            }, "F2",     function () awful.screen.focus(1) end, 'Focus second screen'),

    keydoc.group("Run or Raise"),
    awful.key({ modkey, 'Ctrl', 'Alt' }, 'm', function ()
        local matcher = function (c)
            return awful.rules.match(c, { class = 'mail:mutt' })
        end
        awful.client.run_or_raise(terminal .. ' -e mutt', matcher)
    end, "mutt - Email client"),

    awful.key({ modkey, 'Ctrl', 'Alt' }, 'g', function ()
        local matcher = function (c)
            return awful.rules.match(c, { name = 'misc:gtypist' })
        end
        awful.client.run_or_raise(terminal .. ' -e gtypist', matcher)
    end, "gtypist - Typing tutor"),

    awful.key({ modkey, 'Ctrl', 'Alt' }, 'c', function ()
        local matcher = function (c)
            return awful.rules.match(c, { class = 'misc:cmus' })
        end
        awful.client.run_or_raise('cmus', matcher)
    end, "cmus - Music player"),

    awful.key({ modkey, 'Ctrl', 'Alt' }, 'n', function ()
        local matcher = function (c)
            return awful.rules.match(c, { class = 'misc:newsbeuter' })
        end
        awful.client.run_or_raise(terminal .. ' -e newsbeuter', matcher)
    end, "newsbeuter - RSS reader"),

    awful.key({ modkey, 'Ctrl', 'Alt' }, 'q', function ()
        local matcher = function (c)
            return awful.rules.match(c, { class = 'work:qutebrowser' })
        end
        awful.client.run_or_raise(terminal .. ' -e qutebrowser', matcher)
    end, "luakit - Browser"),

    awful.key({ modkey, 'Ctrl', 'Alt' }, 'v', function ()
        local matcher = function (c)
            return awful.rules.match(c, { class = 'misc:vit' })
        end
        awful.client.run_or_raise(terminal .. ' -e vit', matcher)
    end, "VIT - TaskWarior frontend"),

    keydoc.group("Tags"),
    awful.key({ modkey, }, "Left",   awful.tag.viewprev, "Go to previous tag" ),
    awful.key({ modkey, }, "Right",  awful.tag.viewnext, "Go to next tag"),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore),

    awful.key({ modkey, }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end
    ),

    keydoc.group("Layout manipulation"),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end
    ),

    keydoc.group("Misc"),
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end, "Spawn Terminal"),
    awful.key({ modkey, "Control" }, "r", awesome.restart, "Restart Awesome"),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit, "Quit Awesome"),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function ()
        awful.tag.incnmaster( 1)
        naughty.notify({ title = 'Master', text = tostring(awful.tag.getnmaster()), timeout = 1 })
    end),
    awful.key({ modkey, "Shift"   }, "l", function ()
        awful.tag.incnmaster(-1)
        naughty.notify({ title = 'Master', text = tostring(awful.tag.getnmaster()), timeout = 1 })
    end),
    awful.key({ modkey, "Control" }, "h", function ()
        awful.tag.incncol( 1)
        naughty.notify({ title = 'Columns', text = tostring(awful.tag.getncol()), timeout = 1 })
    end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)
        naughty.notify({ title = 'Columns', text = tostring(awful.tag.getncol()), timeout = 1 })
    end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1)
    end, "Next Layout"),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1)
    end, "Previous Layout"),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    keydoc.group("Prompts"),
    awful.key({ modkey },            "r",     function () promptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
        function ()
            awful.prompt.run({ prompt = "Run Lua code: " },
            promptbox[mouse.screen].widget,
            awful.util.eval, nil,
            awful.util.getdir("cache") .. "/history_eval")
        end,
        "Run Lua code"
    ),

    awful.key({ modkey }, "a",
        function ()
            awful.prompt.run(
                { prompt = "Add task: " },
                promptbox[mouse.screen].widget,
                function (task)
                    awful.util.spawn("task add "..task, false)
                end
            )
        end,
        "Add TaskWarrior task"
    ),

    awful.key({ modkey }, "s",
        function ()
            schedule:display()
        end,
        "Show schedule"
    ),

    awful.key({ modkey }, "w",
        function ()
            shows = {
                as = "Adult Swim",
                fg = "Family Guy",
                s = "The Simpsons",
                at = "Adventure Time",
                amerro = "American Dad",
                future = "Futurama",
                rs = "Regular Show",
                rm = "Rick and Morty",
                sp = "South Park",
                workers = "Workaholics"
            }
            markup = ""
            num = 0
            for k,v in pairs(shows) do
                num = num + 1
                br = ""
                if #shows == num then
                else
                    br = "\n"
                end
                markup = markup .. k .. '  <span color="' .. theme.gray .. '">' .. v .. '</span>' .. br
            end
            markup = '<span weight="bold" color="' .. beautiful.blue .. '">Shows</span>\n' .. markup

            shows_id = naughty.notify({
                text = markup,
                replaces_id = shows_id,
                timeout = 30
            }).id

            awful.prompt.run(
                { prompt = "Watch: " },
                promptbox[mouse.screen].widget,
                function (show)
                    awful.util.spawn("mpv https://www.arconai.tv/"..show.."/ --fullscreen --autofit=1024x768 --screen=0 --fs-screen=0 --ytdl-format=best", false)
                end
            )
        end,
        "Watch TV shows"
    )

    -- Time management solution as a prompt
    -- TaskWarrior prompt

)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey, "Shift"   }, "x",      function (c) xprop(c) end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

root.keys(globalkeys)
