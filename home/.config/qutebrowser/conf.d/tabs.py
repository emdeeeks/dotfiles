prefix = 'tabs.'

settings = {
    'favicons.show': False,
    'indicator.width': 0,
    'padding': {"top": 10, "bottom": 10, "left": 10, "right": 10}
}

for setting,value in settings.items():
    config.set(prefix+setting, value)
