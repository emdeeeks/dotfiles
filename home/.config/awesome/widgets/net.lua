local lain = require("lain")
local markup = lain.util.markup
local beautiful = require("beautiful")
local config = require("config")

return lain.widget.net({
    settings = function()
        f = io.popen("iw dev "..config.network_interface.." link")
        essid = "N/A"
        for line in f:lines() do
            essid   = string.match(line, "SSID: (.+)") or essid
        end
        f:close()

        if tonumber(net_now.sent) > 1024 then
            net_now.sent = string.format("%.2f",net_now.sent/1024)
            sent_suffix = "M"
        else
            sent_suffix = "K"
        end

        if tonumber(net_now.received) > 1024 then
            net_now.received = string.format("%.2f",net_now.received/1024)
            received_suffix = "M"
        else
            received_suffix = "K"
        end
        widget:set_markup("Net " ..markup(beautiful.yellow, essid) .. " " .. markup(beautiful.green, net_now.received .. received_suffix) .. " " .. markup(beautiful.red, net_now.sent .. sent_suffix))
    end
})
