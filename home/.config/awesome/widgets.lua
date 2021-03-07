--[[
--TODO: Sort this out. Move it somewhere better and autoload the widgets.
]]--
local gears = require("gears")



local wibox = require("wibox")
local main_dir = string.format("%s/.config/awesome/", os.getenv("HOME"))
local widgetsd = main_dir .. 'widgets.d/'
local confd = main_dir .. 'widgets/'
local debug = require("gears.debug")
--local config = require("config")
local php = require("misc.lua_php_utils")

local widgets = { ['widget'] = {}}
widgets.spacer = wibox.widget.textbox(" ")
widgets.clock = dofile(confd .. 'clock.lua')
--widgets.clock = assert(dofile(confd .. 'clock.lua'))(config.clock_format)
--assert(loadfile("b.lua"))(10,20,30)

widgets.cpu = dofile(confd .. 'cpu.lua')
widgets.cpu_temp = dofile(confd .. 'cpu_temp.lua')
widgets.mem = dofile(confd .. 'mem.lua')
widgets.bat = dofile(confd .. 'bat.lua')
----widgets.eth = dofile(confd .. 'eth.lua')
widgets.net = dofile(confd .. 'net.lua')
widgets.taglist = dofile(confd .. 'taglist.lua')
widgets.volume = require('widgets/volume')
widgets.wolume = require('widgets/wolume')
widgets.coinmarketcap = require('widgets.coinmarketcap')
widgets.screen = dofile(confd .. 'screen.lua')
--widgets.goal = require('widgets/goal'


-- widgets
for s in lfs.dir(widgetsd) do
    local f = lfs.attributes(widgetsd .. s)
    if s:sub(-4) == ".lua" and f.mode == "file" then
        widgets['widget'][s:sub(0,-5)] = dofile(main_dir .. 'widgets.d/' .. s)
    end
end

--[[
--TO BE USED LATER
--
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
]]--


function widgets.group(widgets_list)
    gears.debug.dump(php.implode(' ', widgets_list))
end

return widgets
