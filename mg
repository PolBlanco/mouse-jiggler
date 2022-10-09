#!/usr/bin/env python3
from argparse import ArgumentParser
parser = ArgumentParser(epilog="And that's all.")
parser.add_argument('-t', default=1, type=int)
parser.add_argument('--INSTALL-DEPENDENCIES', action='store_true', help='Uses pip to install dependencies')
args = parser.parse_args()
if args.INSTALL_DEPENDENCIES:
    try:
        from mouse import move as mv
    except ModuleNotFoundError:
        from os import system
        system('pip install mouse')
else:
    from mouse import move as mv
from time import sleep
try:
    while True:
        mv(-1, 0, absolute=False)
        mv(1, 0, absolute=False)
        sleep(args.t)
except KeyboardInterrupt:
    exit()
