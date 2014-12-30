#!/usr/bin/env python2.7

from urllib2 import urlopen
 
def main():
    print 'Hangman.py (c) 2014, pzp1997'
    print 'Input "exit" or "quit" to quit.'
    print
    
    while True:
        word = urlopen('http://randomword.setgetgo.com/get.php').read()[:-2].upper()
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
                print 'Correct'
                for letter in range(len(word)):
                    if guess == word[letter]:
                        visible = '{0}{1}{2}'.format(visible[:letter], guess, visible[letter+1:])
                if visible == word:
                    print 'YOU WIN!'
                    break
            elif not guess in misses:
                print 'Incorrect'
                misses.append(guess)
                if len(misses) > 5:
                    print 'The word was {0}'.format(word)
                    break
            print
        print
            
 
if __name__ == '__main__':
    main()
