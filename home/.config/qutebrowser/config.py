import glob
import os

config.load_autoconfig()

for f in glob.glob(f'{config.configdir}/conf.d/*.py'):
    if os.path.isfile(f):
        config.source(f)
