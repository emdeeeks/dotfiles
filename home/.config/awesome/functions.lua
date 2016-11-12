function xprop(c)
    f = function (prop, str)
        return
        prop and
        ( str
        .. ((type(prop)=="boolean") and "" or (" = " .. prop))
        .. "\n"
        )
        or ""
    end

    naughty.notify({
        title = "Client info",
        text = ""
        .. f(c.class, "class")
        .. f(c.instance, "instance")
        .. f(c.name, "name")
        .. f(c.type, "type")
        .. f(c.role, "role")
        .. f(c.pid, "pid")
        .. f(c.window, "window_id")
        .. f(c.machine, "machine")
        .. f(c.floating, "Is floating")
        .. f(c.minimized, "Is minimized")
        .. f(c.fullscreen, "Is fullscreen")
        .. f(c.maximized_horizontal, "Is maximized horizontal")
        .. f(c.maximized_vertical, "Is maximized vertical")
        .. f(c.urgent, "Is urgent")
        .. f(c.focused, "Has focus")
        .. f(c.sticky, "Is sticky")
        .. f(c.ontop, "Is ontop")
        .. f(c.above, "Is set above")
        .. f(c.below, "Is set below")
    })
end

function print_r(arr, indentLevel)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..print_r(value, (indentLevel + 1))
        else 
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end
