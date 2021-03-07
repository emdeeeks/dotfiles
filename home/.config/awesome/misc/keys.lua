local awful = require("awful")
local keys = {}

-- TODO: Use this to get key character
--xmodmap -pk | grep -w 44 | awk -F '[()]' '{print $2}'

-- TODO: Use this to check if keyboard is colemak
--awful.spawn.easy_async("setxkbmap -query|grep 'variant'|awk '{print $2}'") == 'colemak'--

keys.rows = {
    --  q      w      e      r      t      y      u      i      o      p
    { '#24', '#25', '#26', '#27', '#28', '#29', '#30', '#31', '#32', '#33' },

    --  a      s      d      f      g      h      j      k      l      ;
    { '#38', '#39', '#40', '#41', '#42', '#43', '#44', '#45', '#46', '#47' },

    --  z      x      c      v      b      n      m      ,      .      /
    { '#52', '#53', '#54', '#55', '#56', '#57', '#58', '#59', '#60', '#61' }
}

-- TODO: Implement layers

keys.restart_awesome =              keys.rows[1][1]
keys.focus_prev_client =            keys.rows[1][3]
keys.focus_next_client =            keys.rows[1][4]
keys.rofi_run =                     keys.rows[1][5]
keys.rofi_window =                  keys.rows[1][6]
keys.above_tags = {
    keys.rows[1][7],
    keys.rows[1][8],
    keys.rows[1][9],
    keys.rows[1][10]
}

keys.swap_with_prev_client =        keys.rows[2][3]
keys.swap_with_next_client =        keys.rows[2][4]
keys.decrease_width =               keys.rows[2][6]
keys.increase_width =               keys.rows[2][9]
keys.decrease_height =              keys.rows[2][7]
keys.increase_height =              keys.rows[2][8]

-- TODO Feed this from conf.d/tags
keys.tags = {
    keys.rows[2][7],
    keys.rows[2][8],
    keys.rows[2][9],
    keys.rows[2][10]
}

keys.close_client =                 keys.rows[3][1]

keys.move_client_to_prev_screen =   keys.rows[3][3]
keys.move_client_to_next_screen =   keys.rows[3][4]

keys.focus_prev_screen =            keys.rows[3][7]
keys.focus_next_screen =            keys.rows[3][8]
keys.help =                         keys.rows[3][9]
keys.open_terminal =                keys.rows[3][10]

return keys
