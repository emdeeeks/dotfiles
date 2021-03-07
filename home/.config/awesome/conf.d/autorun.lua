local awful = require("awful")
local config = require("config")

for _,command in pairs(config.autorun_commands) do
    local options = {}
    local properties = {}

    if type(command) == 'table' then
        command, properties, options = command[1], command[2], command[3]
    end

    if options["terminal"] then
        command = config.terminal .. ' -e ' .. command
    end

    if options["shell"] then
        awful.spawn.with_shell(command)
    else
        awful.spawn.spawn(command, properties)
    end
end
