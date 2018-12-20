local awful = require("awful")

local apps = {
    "dropbox",
    "xrandr-setup",
    "setxkbmap -config ~/.keyboard",
    "unclutter -idle 1 -root"
}

function run_once(prg, times)
    if not prg then
        do return nil end
    end
    times = times or 1
    count_prog = tonumber(io.popen('ps aux | grep "' .. string.gsub(prg, ":", " ") .. '" | grep -v grep | wc -l')) or 0
    if times > count_prog then
        for l = count_prog, times-1 do
            awful.spawn.with_shell(prg)
        end
    end
end

for k,app in pairs(apps) do
    run_once(app)
end
