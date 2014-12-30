#!/usr/bin/env python2.7

"""Finds the Greatest Common Factor (GCF) of
two numbers using the Euclidean Algorithm"""

from sys import argv

__author__ = 'Palmer Paul'
__version__ = '1.0.0'
__email__ = 'pzpaul2002@yahoo.com'

def gcf(a, b):
    while True:
        a, b = b, a%b
        if b == 0:
            return a

def main():
    if len(argv) != 3 or not argv[1].isdigit() or not argv[2].isdigit():
        print 'Usage: gcf.py num1 num2'
    else:
        print gcf(int(argv[1]), int(argv[2]))

if __name__ == '__main__':
    main()
