local awful = require("awful")
local config = require("config")

--[[
TODO:
* Fix run_once. Seems to spawn more than one.
]]--

function run_once(prg, options)
    if not prg then
        do return nil end
    end
    options = options or nil
    count_prog = tonumber(io.popen('ps aux | grep "' .. string.gsub(prg, ":", " ") .. '" | grep -v grep | wc -l')) or 0
    if count_prog == 0 then
        awful.spawn.with_shell(prg, options)
    end
end

for k,app in pairs(config.autorun_apps) do
    run_once(app)
end
