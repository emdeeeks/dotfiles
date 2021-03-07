local awful = require("awful")
local keys = require("misc.keys")
local gears = require("gears")
local naughty = require("naughty")
local inspect = require("misc.inspect")

-- TODO Finish this properly.
tags = {'h', 'j', 'k', 'l'}

for k,v in pairs(keys.tags) do
    command = "sleep 1;xmodmap -pk | grep -w " .. tonumber(string.sub(v, 2)) .. " | awk -F '[()]' '{print $2}' > /tmp/foo.txt"
    awful.spawn.with_shell(command, function(out, err)
        --print(err)
        --print(out)
    end)
    --[[awful.spawn.easy_async_with_shell(command, function(out, err)
        awful.spawn.easy_async_with_shell("cat /tmp/foo.txt", function(out)
            out = tostring(out)
            out = string.gsub(out, "semicolon", ";")
            table.insert(tags, out)
            print('out')
            print(inspect(out))
            print(' ')

        end)
    end)]]
    --print(inspect(tags))
end

awful.screen.connect_for_each_screen(function(s)
    awful.tag(
        tags, s, awful.layout.layouts[1]
    )
end)
