local awful = require("awful")
local config = require("config")

function run_once(prg, options)
    if not prg then
        do return nil end
    end
    options = options or nil
    count_prog = tonumber(io.popen('ps aux | grep "' .. string.gsub(prg, ":", " ") .. '" | grep -v grep | wc -l')) or 0
    if count_prog == 0 then
        print (options)
        awful.spawn.with_shell(prg, options)
    end
end

for k,app in pairs(config.autorun_apps) do
    run_once(app)
end
