local config = require("config")
local awful = require("awful")
local keys = require("misc.keys")

keybindings = config.keys

for i = 1, #keys.tags do
    keybindings.global = awful.util.table.join(keybindings.global,
        awful.key({ config.modkey }, keys.tags[i],
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   tag:view_only()
                end
            end, {
                description = "view tag #"..i, group = "tag"
            }
        ),
        awful.key({ config.modkey, }, keys.above_tags[i],
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end, {
                description = "move focused client to tag #"..i, group = "tag"
            }
        )
    )
end

root.keys(keybindings.global)

return keybindings
