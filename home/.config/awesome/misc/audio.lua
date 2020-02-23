local awful = require("awful")

local function parse_amixer_output(output)
    local is_muted = output:find('%[on%]') == nil
    local volume = output:match('%[(%d+)%%%]')
    return is_muted, tonumber(volume)
end

local audio = {}

function audio.set_volume(percentage)
    local volume_change = tostring(math.abs(percentage)) .. '%' .. (percentage < 0 and '-' or '+')
    awful.spawn.easy_async('amixer -D pulse set Master ' .. volume_change, function() end)
end

function audio.toggle_mute()
    awful.spawn("amixer -D pulse set Master toggle")
end

return audio
