#!/usr/bin/env python2.7

"""Hangman for Terminal"""

from urllib2 import urlopen, URLError

__author__ = 'pzp1997'
__version__ = '1.0.4'
__email__ = 'pzpaul2002@yahoo.com'

def main():
    print 'Hangman.py (c) 2014, pzp1997'
    print 'Input "exit" or "quit" to quit.'
    print
    
    while True:
        err_cnt = 0
        while True:
            try:
               word = urlopen('http://randomword.setgetgo.com/get.php').read()[:-2].upper()
               break
            except URLError:
                err_cnt += 1
                if err_cnt == 5:
                    print 'Error: Could not fetch word. Please make sure you are connected to the internet, and try again later.'
                    raise SystemExit
                
        visible = '-'*len(word)
        misses = []

        while True:
            print visible
            print 'Misses ({0}/6): {1}'.format(len(misses), ', '.join(misses))
            
            guess = ''
            while not guess.isalpha() or len(guess) != 1:
                guess = raw_input('Guess a letter: ').upper()
                if guess == 'EXIT' or guess == 'QUIT':
                    raise SystemExit
                
            if guess in word:
                for letter in range(len(word)):
                    if guess == word[letter]:
                        visible = '{0}{1}{2}'.format(visible[:letter], guess, visible[letter+1:])
                if visible == word:
                    print 'YOU WIN!'
                    break
            elif not guess in misses:
                misses.append(guess)
                if len(misses) > 5:
                    print 'The word was {0}'.format(word)
                    break
            print
        print
            
if __name__ == '__main__':
    main()
