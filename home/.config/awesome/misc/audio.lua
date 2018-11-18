local audio = {}

local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

local function parse_amixer_output(output)
    local is_muted = output:find('%[on%]') == nil
    local volume = output:match('%[(%d+)%%%]')
    return is_muted, tonumber(volume)
end

function audio.set_volume(percentage)
    local volume_change = tostring(math.abs(percentage)) .. '%' .. (percentage < 0 and '-' or '+')
    awful.spawn.easy_async('amixer set Master ' .. volume_change, function(stdout)
        local is_muted, volume = parse_amixer_output(stdout)

        local progress = wibox.widget {
            color = beautiful.green,
            background_color = beautiful.fg_normal,
            forced_height = 10,
            value = volume,
            max_value = 100,
            widget = wibox.widget.progressbar,
            type = 'notification'
        }

        nid = naughty.notify({
            text = "ok",
            replaces_id = nid,
            timeout = 30 
        }).id
        awful.placement.centered(nid)
    end)
end

function audio.toggle_mute()
    awful.spawn("amixer -D pulse sset Master toggle")
end

return audio
