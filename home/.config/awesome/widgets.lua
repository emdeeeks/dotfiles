--[[
--TODO: Sort this out. Move it somewhere better and autoload the widgets.
]]--

local wibox = require("wibox")
local main_dir = string.format("%s/.config/awesome/", os.getenv("HOME"))
local confd = main_dir .. 'widgets/'
local widgets = {}

widgets.spacer = wibox.widget.textbox(" ")
widgets.clock = dofile(confd .. 'clock.lua')
widgets.cpu = dofile(confd .. 'cpu.lua')
widgets.cpu_temp = dofile(confd .. 'cpu_temp.lua')
widgets.mem = dofile(confd .. 'mem.lua')
widgets.bat = dofile(confd .. 'bat.lua')
widgets.btc = dofile(confd .. 'btc.lua')
widgets.net = dofile(confd .. 'net.lua')
widgets.taglist = dofile(confd .. 'taglist.lua')
widgets.volume = dofile(confd .. 'volume.lua')

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

return widgets
