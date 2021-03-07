local lain = require("lain")
local markup = lain.util.markup
local beautiful = require("beautiful")
local awful = require("awful")
--local config = require("config")

return awful.widget.watch(
    --https://api.coinbase.com/v2/prices/BTC-USD/spot
    "curl -m5 -s -k 'https://api.coinmarketcap.com/v1/ticker/bitcoin/'",
    60,
    function(widget, stdout)
        local total = 0
        local btc, pos, err = require("lain.util").dkjson.decode(stdout, 1, nil)

        if btc then
            local price = (tonumber(btc[1]["price_usd"]))
            local value = "$" .. string.format("%.2f", price)
            widget:set_markup('BTC ?')
            if(not err and btc[1]) then
                local percent_change = btc[1]["percent_change_24h"]
                if(string.sub(percent_change, 1, 1) == "-") then
                    percent_change = markup(beautiful.red, percent_change..'%')
                else
                    percent_change = markup(beautiful.green, '+'..percent_change..'%')
                end
                widget:set_markup("BTC " .. markup(beautiful.yellow, '$' .. string.format("%.2f", btc[1]["price_usd"]) .. " " .. percent_change))
            end
        end
    end
)
