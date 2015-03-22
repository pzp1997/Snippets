#!/usr/bin/env python2.7

"""Finds the Greatest Common Factor (GCF) of
two numbers using the Euclidean Algorithm"""

from sys import argv

__author__ = 'Palmer (pzp1997)'
__version__ = '1.0.1'
__email__ = 'pzpaul2002@yahoo.com'

def euclid_gcf(a, b):
    while True:
        a, b = b, a%b
        if b == 0:
            return a

def main():
    if len(argv) < 2:
        print "Usage: gcf.py num ..."
    else:
        for i in range(1, len(argv)):
            try:
                argv[i] = abs(int(argv[i]))
            except ValueError:
                print "Usage: gcf.py num ..."
                raise SystemExit
        print reduce(euclid_gcf, argv[1:])

if __name__ == '__main__':
    main()
