#!/usr/bin/env python3

from time import sleep as _S
import sys
import pickle

if len(sys.argv) >= 2 :
    try:
        sleep_time = float(sys.argv[1])
    except:
        sys.stderr.write('Please pass a float number for sleep time as first argument :/\nDefault is 0.09\n')
        sys.exit()
else:
    sleep_time = 0.09
with open('data.ansi','rb') as p:
    frames = pickle.load(p)
try :
    while True:
        for frame in frames:
            sys.stdout.write(frame)
            _S(sleep_time)
            sys.stdout.write('\033[F' * len(frame.splitlines()))
except KeyboardInterrupt:
    sys.exit()
