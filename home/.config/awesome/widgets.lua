local awful = require("awful")
local wibox = require("wibox")
local config = require("config")
local json = require("json")
local misc = require("misc")
local beautiful = require("beautiful")
local lain = require("lain")
local markup     = lain.util.markup
local functions = require("functions")

local widgets = {}

widgets.clock = wibox.container.margin(
    wibox.widget.textclock(config.clock_format), 10, 10, 10, 10
)

widgets.cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup("Cpu " .. markup(beautiful.yellow, cpu_now.usage .. "%"))
    end
})

widgets.cpu_temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup(beautiful.yellow, coretemp_now .. "°C"))
    end
})

widgets.btc = awful.widget.watch(
    "curl -m5 -s 'https://api.coinmarketcap.com/v1/ticker/bitcoin/'",
    60,
    function(widget, stdout)
        local total = 0

        local btc, pos, err = require("lain.util").dkjson.decode(stdout, 1, nil)

        if btc then
            local value = (total * tonumber(btc[1]["price_usd"]))
            local value = "$" .. string.format("%.2f", value)
            widget:set_markup('N/A')
            if(not err and btc[1]) then
                local percent_change = btc[1]["percent_change_24h"]
                if(string.sub(percent_change, 1, 1) == "-") then
                    percent_change = markup(beautiful.red, percent_change..'%')
                else
                    percent_change = markup(beautiful.green, '+'..percent_change..'%')
                end
                widget:set_markup("BTC " .. markup(beautiful.yellow, '$' .. string.format("%.2f", btc[1]["price_usd"]) .. " " .. percent_change))
            end
        end
    end
)

widgets.mem = lain.widget.mem({
    settings = function()
        widget:set_markup("Mem " .. markup(beautiful.blue, mem_now.perc .. '%'))
    end
})

widgets.net = lain.widget.net({
    settings = function()
        f = io.popen("iw dev "..config.network_interface.." link")
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
widgets.bat = lain.widget.bat({
    -- Get charging status.
    -- If charging, show green.
    -- If off power, not charging, show red
    -- otherwise, show default.  
    settings = function()
        widget:set_markup("Bat " .. markup(beautiful.cyan, bat_now.perc .. "%"))
    end
})
]]--

widgets.bat = lain.widget.bat({
    settings = function()
        if bat_now.status == 'Charging' then
            color = beautiful.green
        end
        widget:set_markup("Bat " .. markup(beautiful.cyan, bat_now.perc .. "%"))
    end
})

-- shows used (percentage) and remaining space in home partition
--[[
widgets.fs = lain.widget.fs({
    showpopup = 'off',
    settings  = function()
        widget:set_text("/home: " ..  fs_now["/"].percentage .. "% (" ..
        fs_now["/"].free .. " " .. fs_now["/"].units .. " left)")
    end
})
]]--
-- output example: "/home: 37% (239.4 Gb left)"

-- shows used (percentage) and remaining space in home partition
--[[
local fsroothome = lain.widget.fs({
    settings  = function()
        widget:set_text("/home: " ..  fs_now["/home"].percentage .. "% (" ..
        fs_now["/home"].free .. " " .. fs_now["/home"].units .. " left)")
    end
})
]]--
-- output example: "/home: 37% (239.4 Gb left)"

--[[
local fswidget= lain.widget.fs({
    options = "--exclude-type=tmpfs",
    settings  = function()
    end
})
]]--

widget_list = {
    'widgets.cpu',
    'widgets.cpu_temp'
}

spacer = ' '

function widgets.get(widget_list, spacer)
    for k,widget in ipairs(widget_list) do
        local color = get_next_color()
        print(color)
        -- if it's not the last,
        -- add a spacer
    end
    return table.concat(widget_list,", ")
end

label_colors = beautiful.xresources.get_current_theme()



--[[
loop over bars
    loop over widgets
        show each widget with next_color()
        and space if not last widget in bar
]]--

colors_counter = {}
function get_next_color(id)
    id = id or "default"
    if colors_counter[id] then
        colors_counter[id] = math.fmod(colors_counter[id] + 1, 15) + 1
    else
        colors_counter[id] = 1
    end
    return label_colors["color"..tostring(colors_counter[id], 15)]
end

return widgets
