local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")
local home = os.getenv("HOME")
local markup     = lain.util.markup

local mytextclock = wibox.container.margin(
    wibox.widget.textclock("%A %B %d, %R")
, 10, 10, 10, 10)

local fswidget= lain.widget.fs({
    options = "--exclude-type=tmpfs",
    settings  = function()
        fs_header = " Fs "
        widget:set_markup(fs_header .. markup(beautiful.magenta, fs_now.used .. "% "))
    end
})

local cpuwidget = lain.widget.cpu({
    settings = function()
        cpu_header = " Cpu "
        widget:set_markup(cpu_header .. markup(beautiful.yellow, cpu_now.usage .. "% "))
    end
})

local tempwidget = lain.widget.temp({
    settings = function()
        widget:set_markup(markup(beautiful.yellow, coretemp_now .. "°C "))
    end
})

local memwidget = lain.widget.mem({
    settings = function()
        mem_header = " Mem "
        widget:set_markup(mem_header .. markup(beautiful.blue, mem_now.used .. "M "))
    end
})

local netdownwidget = wibox.widget.textbox()
local netupwidget = lain.widget.net({
    settings = function()
        net_header = " Net "
        widget:set_markup(net_header .. markup(beautiful.green, net_now.sent .. " "))
        netdownwidget:set_markup(markup(beautiful.red, net_now.received .. " "))
    end
})

local batwidget = lain.widget.bat({
    settings = function()
        bat_header = " Bat "
        bat_p      = bat_now.perc .. "% "
        widget:set_markup(bat_header .. markup(beautiful.cyan, bat_p))
    end
})

--[[
local taglist_buttons = awful.util.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)
]]--

root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize)
)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = wibox.container.margin(awful.widget.layoutbox(s), 10, 10, 10, 10)
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
    s.mytasklist = wibox.container.margin(awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags), 10, 10, 10, 10)

    s.topwibox = awful.wibar({
        position = "top",
        screen = s,
        height = 40
    })

    s.topwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mypromptbox,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytasklist, -- Middle widget
        }
    }

    s.bottomwibox = awful.wibar({
        position = "bottom",
        screen = s,
        height = 40
    })

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"
    s.bottomwibox:setup {
        layout = wiboxlayout,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            cpuwidget,
            tempwidget,
            memwidget,
            netupwidget,
            netdownwidget,
            batwidget,
            fswidget
        },
        {
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
        },
    }
end)
