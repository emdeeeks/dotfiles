import yaml
import glob
import os

for f in glob.glob(f'{config.configdir}/conf.d/*.py'):
    if os.path.isfile(f):
        config.source(f)
