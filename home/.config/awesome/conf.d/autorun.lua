--[[
--TODO: Well, this STILL doesn't work :(
]]--

local awful = require("awful")
local config = require("config")

for k,app in pairs(config.autorun_apps) do
    local options = {}
    local properties = {}

    if type(app) == 'table' then
        command, properties, options = app[1], app[2], app[3]
    end
    app = nil

    if options["terminal"] then
        command = config.terminal .. ' -e ' .. command
    end

    if options["shell"] then
        awful.spawn.with_shell(command)
    else
        awful.spawn(command, properties)
    end
end
