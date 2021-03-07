local awful = require("awful")
local gears = require("gears")
local audio = {}

function audio.set_volume(percentage)
    local volume_change = tostring(math.abs(percentage)) .. '%' .. (percentage < 0 and '-' or '+')
    awful.spawn.easy_async('amixer -D pulse set Master ' .. volume_change, function() end)
    --gears.debug.dump(widgets)
    --widgets.wolume:set_markup(volume_change)
end

function audio.toggle_mute()
    awful.spawn("amixer -D pulse set Master toggle")
end

-- TODO: Return audio info
--local command = "amixer -D pulse get Master"
--function audio.get_info()
    --awful.spawn.easy_async_with_shell(command, function(stdout, stderr, reason, exit_code)
        --stdout = string.match(stdout, "%[(o[^%]]*)%]")
        --naughty.notify { text = stdout }
        --on = string.find(stdout, "on", 1, true) or nil

        --out = ""

        --widget:set_markup("")

        --if volume ~= 100 or not on then
            --out = out .. volume .. "%"
            --if not on then
                --out = out .. " " .. markup(beautiful.red, 'M')
            --end
            --widget:set_markup("VOL " .. markup(beautiful.cyan, out))
        --end

    --end)
--end

return audio
