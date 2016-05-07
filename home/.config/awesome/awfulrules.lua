awful.rules.rules = {
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = true,
            keys = clientkeys,
            buttons = clientbuttons,
            size_hints_honor = false
        }
    },
    {
        rule = { class = "qutebrowser"  },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "work")
        end
    },
    {
        rule = { class = "URxvt", name = "gtypist" },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "misc")
        end
    },
    {
        rule = { class = "URxvt", name = "mutt"  },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "mail")
        end
    },
    {
        rule = { class = "URxvt", name = "vit"  },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "misc")
        end
    },
    {
        rule = { class = "URxvt", name = "newsbeuter"  },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "misc")
        end
    },
    {
        rule = { class = "URxvt", name = "lnav"  },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "sys")
        end
    },
    {
        rule = { class = "URxvt", name = "glances"  },
        callback = function(c)
            awful.client.property.set(c, "overwrite_class", "sys")
        end
    },
    {
        rule = { class = "gimp" },
        properties = { floating = true }
    },
    {
        rule = { class = "skype" },
        properties = { floating = true }
    },
}
