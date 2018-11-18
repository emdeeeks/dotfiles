local json = require("json")
local http = require("socket.http")
local endpoint = "http://192.168.0.24/api"
local key = "tggHBcKmbkLwni4WL1tWwaPiQhUFgVkPWoonQYiD"
local beautiful = require("beautiful")

local hue = {}

function to_the_power_of(num, by)
    x = 0
    total = 1
    for i = 1, by, 1 do
        total = (total * num)
    end
    return total
end


function hue.hex2cie(hex)
    local values = {}

    hex = hex:gsub("#","")

    red, green, blue = tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))

    red = (red / 255)
    green = (green / 255)
    blue = (blue / 255)

    if(red > 0.04045) then
        values["red"] = to_the_power_of(((red + 0.055) / 1.055), 2.4)
    else
        values["red"] = (red / 12.92)
    end

    if(green > 0.04045) then
        values["green"] = to_the_power_of(((green + 0.055) / 1.055), 2.4)
    else
        values["green"] = (green / 12.92)
    end

    if(blue > 0.04045) then
        values["blue"] = to_the_power_of(((blue + 0.055) / 1.055), 2.4)
    else
        values["blue"] = (blue / 12.92)
    end

    local X = (red * 0.664511 + green * 0.154324 + blue * 0.162028)
    local Y = (red * 0.283881 + green * 0.668433 + blue * 0.047685)
    local Z =  (red * 0.000088 + green * 0.072310 + blue * 0.986039)

    local cx = (X / (X + Y + Z))
	local cy = (Y / (X + Y + Z))

    local cx, cy = tonumber(string.format("%.4f", cx)),tonumber(string.format("%.4f", cy))
    return cx, cy
end

function hue.request(url, data)
    local data = json.encode(data)
    url = 'http://192.168.0.24/api/'..key..'/groups/1/action'
    local f = io.popen('curl '.. url .. ' -fsm 3 -X PUT --data \''..data..'\'')
    f:close()
end

function merge(a, b)
    if type(a) == 'table' and type(b) == 'table' then
        for k,v in pairs(b) do if type(v)=='table' and type(a[k] or false)=='table' then merge(a[k],v) else a[k]=v end end
    end
    return a
end

function hue.setcolor(color)
    local x,y = hue.hex2cie(color)
    hue.request('/groups/1/action', { xy = { x, y }})
end

return hue
