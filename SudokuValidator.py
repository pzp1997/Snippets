#!/usr/bin/env python2.7

"""
Checks if a Sudoku solution is correct.
Input: A file containing 9 rows of 9 space seperated numbers
Example:
5 3 4 6 7 8 9 1 2
6 7 2 1 9 5 3 4 8
1 9 8 3 4 2 5 6 7
8 5 9 7 6 1 4 2 3
4 2 6 8 5 3 7 9 1
7 1 3 9 2 4 8 5 6
9 6 1 5 3 7 2 8 4
2 8 7 4 1 9 6 3 5
3 4 5 2 8 6 1 7 9
"""

from sys import argv

__author__ = 'Palmer (pzp1997)'
__version__ = '1.0.0'
__email__ = 'pzpaul2002@yahoo.com'

def readFile(fname):
    data = []
    with open(fname, 'r') as f:
        data = f.read().split('\n')
        
    for line in range(len(data)):
        data[line] = data[line].split(' ')

    return data

def valid(board):
    for n in range(1, 10):
        n = str(n)
        
        # rows
        for i in board:
            if not n in i:
                return False

        # columns
        for j in range(len(board)):
            if not n in [board[i][j] for i in range(len(board))]:
                return False

        #boxes
        row, col = 0, 0
        for x in range(9):
            if not n in [board[i][j] for i in range(row, row+3) for j in range(col, col+3)]:
                return False

            row += 3
            if row == 9:
                row = 0
                col += 3

    return True

def main():
    if len(argv) == 1:
        board = raw_input('Input the filename of a Sudoku Board: ')
    elif len(argv) == 2:
        board = argv[1]
    else:
        print 'Usage: ./SudokuValidator.py <board>'
        raise SystemExit
        
    if valid(readFile(board)):
        print 'Correct Solution'
    else:
        print 'Sorry, but that solution is incorrect'

if __name__ == '__main__':
    main()
