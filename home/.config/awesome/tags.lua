tags = {
	names = {
		"1:web",
		"2:mail",
		"3:skype",
		"4:git",
		"5",
		"6",
		"7",
		"8",
		"9"
	},
	layout = {
		layouts[3],
		layouts[3],
		layouts[3],
		layouts[3],
		layouts[3],
		layouts[3],
		layouts[3],
		layouts[3],
		layouts[3]
    },
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
end


