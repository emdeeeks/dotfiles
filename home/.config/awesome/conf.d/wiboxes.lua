local awful = require("awful")
local lain = require("lain")
local markup     = lain.util.markup
local wibox = require("wibox")
local beautiful = require("beautiful")
local home = os.getenv("HOME")
local lfs = require("lfs")
local path = os.getenv('HOME').. '/.config/awesome/conf.d/wiboxes'
local gears = require("gears")
local json = require("json")
local misc = require("misc")
local beautiful = require("beautiful")

local space = wibox.widget.textbox(" ")

local textclock = wibox.container.margin(
    wibox.widget.textclock("%A %B %d, %R"), 10, 10, 10, 10
)

--[[
local fswidget = lain.widget.fs({
    notify = 'off',
    show_popup = 'off',
    settings  = function()
        --local home_used = tonumber(fs_info["/home used_p"]) or 0
        --widget:set_text("/ " .. fs_now.used .. "% | /home " .. home_used .. "% ")
        widget:set_markup("Fs " .. markup(beautiful.magenta, fs_now.used .. "%"))
    end
})
]]--

--[[
local fswidget= lain.widget.fs({
    options = "--exclude-type=tmpfs",
    settings  = function()
    end
})
]]--

local cpuwidget = lain.widget.cpu({
    settings = function()
        widget:set_markup("Cpu " .. markup(beautiful.yellow, cpu_now.usage .. "%"))
    end
})

local tempwidget = lain.widget.temp({
    settings = function()
        widget:set_markup(markup(beautiful.yellow, coretemp_now .. "°C"))
    end
})


local vitaewidget = awful.widget.watch(
    "curl -m5 -s 'https://api.coinmarketcap.com/v1/ticker/vitae/'",
    (60 * 5),
    function(widget, stdout)
        local total = 0

        local vitae, pos, err = require("lain.util").dkjson.decode(stdout, 1, nil)

        if vitae then
            local value = (total * tonumber(vitae[1]["price_usd"]))
            local value = "$" .. string.format("%.2f", value)
            widget:set_markup('N/A')
            if(not err and vitae[1]) then
                local percent_change = vitae[1]["percent_change_24h"]
                if(string.sub(percent_change, 1, 1) == "-") then
                    percent_change = markup(beautiful.red, percent_change..'%')
                else
                    percent_change = markup(beautiful.green, '+'..percent_change..'%')
                end
                widget:set_markup("Vitae " .. markup(beautiful.yellow, '$' .. string.format("%.2f", vitae[1]["price_usd"]) .. " " .. percent_change))
            end
        end
    end
)

local memwidget = lain.widget.mem({
    settings = function()
        if tonumber(mem_now.used) > 1024 then
            mem_now.used = string.format("%.2f", mem_now.used/1024)
            suffix = "G"
        else
            suffix = "M"
        end
        widget:set_markup("Mem " .. markup(beautiful.blue, mem_now.used .. suffix))
    end
})

local netwidget = lain.widget.net({
    settings = function()
        f = io.popen("iw dev wlp11s0 link")
        essid = "N/A"
        for line in f:lines() do
            essid   = string.match(line, "SSID: (.+)") or essid
        end
        f:close()

        if tonumber(net_now.sent) > 1024 then
            net_now.sent = string.format("%.2f",net_now.sent/1024)
            sent_suffix = "M"
        else
            sent_suffix = "K"
        end

        if tonumber(net_now.received) > 1024 then
            net_now.received = string.format("%.2f",net_now.received/1024)
            received_suffix = "M"
        else
            received_suffix = "K"
        end
        widget:set_markup("Net " ..markup(beautiful.yellow, essid) .. " " .. markup(beautiful.green, net_now.received .. received_suffix) .. " " .. markup(beautiful.red, net_now.sent .. sent_suffix))
    end
})

--[[
local batwidget = lain.widget.bat({
    settings = function()
        widget:set_markup("Bat " .. markup(beautiful.cyan, bat_now.perc .. "%"))
    end
})
]]--



awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    s.mypromptbox = awful.widget.prompt()
    s.mytaglist = wibox.container.margin(awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons), 10, 10, 10,10)
    s.mytasklist = wibox.container.margin(awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags), 10, 10, 10, 10)

    s.topwibox = awful.wibar({
        position = "top",
        screen = s,
        height = 40,
	opacity = beautiful.wibar_opacity or 1
    })

    s.topwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytasklist, -- Middle widget
        }
    }

    s.bottomwibox = awful.wibar({
        position = "bottom",
        screen = s,
        height = 40,
	opacity = beautiful.wibar_opacity or 1
    })

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"
    s.bottomwibox:setup {
        layout = wiboxlayout,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            cpuwidget,
            space,
            tempwidget,
            space,
            memwidget,
            space,
            netwidget,
            space,
            vitaewidget,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            textclock
        },
    }


end)

--[[
local widgets = {}
local bars = {}

for position in lfs.dir(path) do
    local file_path = path..'/'..position
    if position ~= "." and position ~= ".." then
        bars[position] = {}
        for alignment in lfs.dir(file_path) do
            if alignment ~= "." and alignment ~= ".." then
                bars[position] = { widgets = {}}
                bars[position]["layout"] = wibox.layout.fixed.horizontal
                local file_path = path..'/'..position .. '/' .. alignment
                widgets = {}
                for widget in lfs.dir(file_path) do
                    if widget ~= "." and widget ~= ".." then
                        widget_name = string.match(widget, '(.+)%.(.+)')
                        out = dofile(file_path .. '/' .. widget)
                        --widgets[widget_name]
                    end
                end
                bars[position]["widgets"] = widgets
            end
        end
    end
end

awful.screen.connect_for_each_screen(function(s)

    local wiboxlayout = wibox.layout.align.horizontal()
    wiboxlayout.expand = "none"

--    print_table(bars)

    for position,bar in pairs(bars) do
        print_table(bar)
        print(bar['layout'])

        s.mywibox = awful.wibar({
            position = position,
            screen = s,
            height = 40
        })
        s.mywibox:setup {
            layout = wibox.layout.fixed.horizontal,
            --bar['layout'],
            --widgets['textclock']
            --widgets
            --bar['widgets']
        }
    end
end)
]]--
