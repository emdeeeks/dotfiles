settings = {
    'messages.timeout': 5000
}

for setting,value in settings.items():
    config.set(setting, value)
