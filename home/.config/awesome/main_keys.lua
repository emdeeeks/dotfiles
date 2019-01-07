local keys = {}

keys.home_row = {
    { 'a','s','d','f' },
    { 'h','j','k','l' }
}

if io.popen("setxkbmap -query|grep 'variant'|awk '{print $2}'"):read() == 'colemak' then
    keys.home_row = {
        { 'a','r','s','t' },
        { 'n','e','i','o' }
    }
end

keys.KEY_LEFT = keys.home_row[2][1]
keys.KEY_DOWN = keys.home_row[2][2]
keys.KEY_UP = keys.home_row[2][3]
keys.KEY_RIGHT = keys.home_row[2][4]

return keys
