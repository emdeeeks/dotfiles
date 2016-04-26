function run_once(prg,arg_string,pname, screen)
    screen = screen or 1

    if not prg then
        do return nil end
    end

    if not pname then
       pname = prg
    end

    if not arg_string then
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
    else
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
    end
end

run_once('connect-heidis-internet')
run_once('xrandr-setup')
run_once('redshift')
run_once('rescuetime')
run_once('qutebrowser', nil, "work")
run_once(terminal .. " -e ssh synbyte.com", nil, "ssh")
run_once(terminal .. " -e cds", nil, "work")
run_once(terminal .. " -e mutt", nil, "mail")
run_once(terminal .. " -e newsbeuter", nil, "misc")
run_once(terminal .. " -e vit", nil, "misc")
run_once(terminal .. " -e gtypist", nil, "misc")
