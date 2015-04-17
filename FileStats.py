#!/usr/bin/env python2.7

"""Gives stats (number of lines, words, and characters) for a file"""

from sys import argv

__author__ = 'Palmer (pzp1997)'
__version__ = '1.0.0'
__email__ = 'pzpaul2002@yahoo.com'


def get_file_content(fname):
    """Returns contents of file fname"""
    with open(fname, 'r') as file_ptr:
        return file_ptr.read()


def line_count(text):
    """Returns number of lines in string text"""
    return len(text.splitlines())


def word_count(text):
    """Returns number of words in string text"""
    return len(text.split())


def char_count(text):
    """Returns number of characters in string text"""
    return len(text)


def main():
    """User interface"""
    filename = raw_input("Filename: ") if len(argv) < 2 else argv[1]
    data = get_file_content(filename)
    print "{lines} lines\n{words} words\n{chars} characters".format(
        lines=line_count(data), words=word_count(data), chars=char_count(data))

if __name__ == '__main__':
    main()
