import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

foreground = xresources['*.foreground']
background = xresources['*.background']

black = xresources['*.color0']
red = xresources['*.color1']
green = xresources['*.color2']
yellow = xresources['*.color3']
blue = xresources['*.color4']
magenta = xresources['*.color5']
magenta = xresources['*.color6']
white = xresources['*.color7']

prefix = 'colors.'

colors = {
    'completion.fg': [foreground, foreground, foreground],
    'completion.odd.bg': background,
    'completion.even.bg': background,
    'completion.category.fg': white,
    'completion.category.bg': background,
    'completion.category.border.top': background,
    'completion.category.border.bottom': background,
    'completion.item.selected.fg': white,
    'completion.item.selected.bg': background,
    'completion.item.selected.border.top': background,
    'completion.item.selected.border.bottom': background,
    'completion.match.fg': yellow,
    'completion.scrollbar.fg': foreground,
    'completion.scrollbar.bg': background,

    'downloads.bar.bg': background,
    'downloads.start.fg': foreground,
    'downloads.start.bg': background,
    'downloads.stop.fg': green,
    'downloads.stop.bg': background,
    'downloads.system.fg': 'none',
    'downloads.system.bg': 'none',
    'downloads.error.fg': red,
    'downloads.error.bg': background,

    'hints.fg': white,
    'hints.bg': background,
    'hints.match.fg': yellow,

    'keyhint.fg': foreground,
    'keyhint.suffix.fg': blue,
    'keyhint.bg': background,

    'messages.error.fg': red,
    'messages.error.bg': background,
    'messages.error.border': background,
    'messages.warning.fg': yellow,
    'messages.warning.bg': background,
    'messages.warning.border': background,
    'messages.info.fg': blue,
    'messages.info.bg': background,
    'messages.info.border': background,

    'prompts.fg': foreground,
    'prompts.border': background,
    'prompts.bg': background,
    'prompts.selected.bg': background,

    'statusbar.normal.fg': foreground,
    'statusbar.normal.bg': background,
    'statusbar.insert.fg': foreground,
    'statusbar.insert.bg': background,
    'statusbar.passthrough.fg': foreground,
    'statusbar.passthrough.bg': background,
    'statusbar.private.fg': foreground,
    'statusbar.private.bg': background,
    'statusbar.command.fg': foreground,
    'statusbar.command.bg': background,
    'statusbar.command.private.fg': foreground,
    'statusbar.command.private.bg': background,
    'statusbar.caret.fg': foreground,
    'statusbar.caret.bg': background,
    'statusbar.caret.selection.fg': foreground,
    'statusbar.caret.selection.bg': background,
    'statusbar.progress.bg': background,
    'statusbar.url.fg': foreground,
    'statusbar.url.error.fg': red,
    'statusbar.url.hover.fg': foreground,
    'statusbar.url.success.http.fg': green,
    'statusbar.url.success.https.fg': green,
    'statusbar.url.warn.fg': yellow,

    'tabs.bar.bg': red,
    'tabs.indicator.start': foreground,
    'tabs.indicator.stop': green,
    'tabs.indicator.error': red,
    'tabs.indicator.system': 'none',
    'tabs.odd.fg': foreground,
    'tabs.odd.bg': background,
    'tabs.even.fg': foreground,
    'tabs.even.bg': background,
    'tabs.selected.odd.fg': green,
    'tabs.selected.odd.bg': background,
    'tabs.selected.even.fg': green,
    'tabs.selected.even.bg': background,
    'webpage.bg': 'white'

}

for item, color in colors.items():
    config.set(prefix+item, color),

c.content.host_blocking.whitelist = ["www.googleadservices.com", "googleadservices.com", "piwik.org", "maxbounty.com", "www.maxbounty.com", "trackcmp.net", "analytics.google.com"]

settinglist = [
    'completion.entry',
    'completion.category',
    'debug_console',
    'downloads',
    'hints',
    'keyhint',
    'messages.error',
    'messages.info',
    'messages.warning',
    'prompts',
    'statusbar',
    'tabs',
]

def setfont(item, font, size=10):
    setting = 'fonts.{}'.format(item)
    font = '{}pt {}'.format(size, font)
    config.set(setting, font)

mainfont= 'Terminus'

for setting in settinglist:
    setfont(setting, mainfont, size=10)
