#!/usr/bin/env python2.7

"""
Decorator that logs the input and output of a function. Useful for debugging.
"""

from functools import wraps

__author__ = 'Palmer Paul'
__version__ = '1.0.0'
__email__ = 'pzpaul2002@yahoo.com'


def logger(func):
    """Logs the input/output of decorated function"""
    @wraps(func)
    def inner(*args, **kwargs):
        ret_val = func(*args, **kwargs)
        print "{}({}{}{}) --> {}".format(
            func.__name__,
            ', '.join(str(x) for x in args),
            ', ' if len(args) > 0 and len(kwargs) > 0 else '',
            ', '.join('{}={}'.format(k, v) for k, v in kwargs.iteritems()),
            ret_val)
        return ret_val
    return inner


@logger
def foo(*args, **kwargs):
    """Returns True if passed an even number of arguments, False otherwise."""
    return not (len(args) + len(kwargs)) & 1

if __name__ == '__main__':
    foo()
    foo(1, 'a', [[1, 2, 3], [4, 5, 6]])
    foo(a=1, b='2', c='3')
    foo('abc', xyz='123')
