tyrannical.settings.default_layout =  awful.layout.suit.tile.left
tyrannical.tags = {
    {
        name        = "1:work",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        class       = { "work" }
    },
    {
        name        = "2:mail",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        intrusive   = true,
        class       = { "mail" }
    },
    {
        name        = "3:skype",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        class       = { "skype" }
    },
    {
        name        = "4:sys",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        intrusive   = true,
        class       = { "sys" }
    },
    {
        name        = "5:ssh",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        intrusive   = true,
        class       = { "ssh" }
    },
    {
        name        = "6:misc",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        intrusive   = true,
        class       = { "misc" }
    },
    {
        name        = "7",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        intrusive   = true,
    },
    {
        name        = "8",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        intrusive   = true,
    },
    {
        name        = "9",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        intrusive   = true,
    },
}

tyrannical.properties.intrusive = {
    "Xephyr",
}

tyrannical.properties.floating = {
    "file-roller", "skype", "gimp"
}

tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true
tyrannical.settings.client.no_focus_stealing_in = true
