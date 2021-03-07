local lain = require("lain")
local markup = lain.util.markup
local beautiful = require("beautiful")
local config = require("config")
local awful = require("awful")
local inspect = require("misc.inspect")

local function get_link_info()
    -- iw dev '..adaptor..' link
end

local command = "sleep 1; route |nc -z 8.8.8.8 53 > /tmp/dns.txt"
function get_dns_status()
    awful.spawn.easy_async_with_shell(command, function(stdout, stderr, reason, exit_code)
        awful.spawn.easy_async_with_shell("cat /tmp/dns.txt", function(out)
            dns = dns:gsub("%s+", "")
            dns = exit_code
            return dns
        end)
    end)
end

function get_internet_status()
    -- ping -q google.com -c 1
end

-- This is the correct way
local command = "sleep 1; route |awk '/^default/{print $NF}' > /tmp/foo.txt"

local function get_adaptor()
    awful.spawn.easy_async_with_shell(command, function()
        awful.spawn.easy_async_with_shell("cat /tmp/foo.txt", function(out)
            return out
        end)
    end)
end

adaptor = get_adaptor() or ''
dns = get_dns_status() or ''

-- iwgetid -r (SSID)

--return awful.widget.watch('iw dev '..adaptor..' link', 10, function(widget, stdout)
return awful.widget.watch('iwgetid -r', 10, function(widget, stdout)
    for line in stdout:gmatch("[^\r\n]+") do
        essid = line:match("SSID: (.+)")
        -- strength?
    end
    widget:set_markup(adaptor)
    --print(adaptor .. ' ' .. dns)
end)
