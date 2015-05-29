tyrannical.tags = {
    {
        name        = "1:web",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
        instance    = {"web"},
        class       = {
            "luakit", "chromium"
        }
    },
    {
        name        = "2:mail",
        init        = true,
        exclusive   = true,
        --screen    = screen.count()>1 and 2 or 1,-- Setup on screen 2 if there is more than 1 screen, else on screen 1
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
        class = {
            "evolution"
        }
    },
    {
        name        = "3:skype",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
        class  = {
            "skype"
        }
    },
    {
        name        = "4:git",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
    },
    {
        name        = "5",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
    },
    {
        name        = "6",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
    },
    {
        name        = "7",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
    },
    {
        name        = "8",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
    },
    {
        name        = "9",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.tile,
    },
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
    "Xephyr",
}

tyrannical.properties.floating = {
    "flie-roller", "skype"
}
