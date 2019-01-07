settings = {
    'messages.timeout': 5000,
    'content.plugins': True,
    'content.cookies.accept': 'all',
    'keyhint.radius': 0,
    'prompt.radius': 0
}

for setting,value in settings.items():
    config.set(setting, value)
