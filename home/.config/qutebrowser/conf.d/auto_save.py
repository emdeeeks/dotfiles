prefix = 'auto_save.'

settings = {
    'session': True
}

for setting,value in settings.items():
    config.set(prefix+setting, value)
