local awful = require("awful")
local terminal = "x-terminal-emulator"

local function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd))
end

run_once('redshift')
run_once('rescuetime')
run_once('qutebrowser')
run_once(terminal .. " -e ssh synbyte.com")
run_once(terminal .. " -e mutt")
run_once('dropbox start')
