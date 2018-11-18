local yaml = require('misc/tinyyaml')
local home = os.getenv("HOME")
local gears = require("gears")

local main_dir = string.format("%s/.config/awesome/", home)

local config = {}
local settings = {}

local configFile = io.open(main_dir ..'config.yml', 'r')

if configFile then
    local configYaml = configFile:read('*all')
    configFile:close()
    settings = yaml.parse(configYaml)
end

function config.get(key)
    return settings[key] or nil
end
return config
