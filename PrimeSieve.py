def primeslt(n):
    """Finds all primes less than n"""
    
    if n < 3:
        return []
    
    A = [True] * n
    A[0], A[1] = False, False
    
    for i in range(2, int(n**0.5)+1):
        if A[i]:
            j = i**2
            while j < n:
                A[j] = False
                j += i
                
    return [num for num in range(n) if A[num]]

def main():
    i = ''
    while not i.isdigit():
        i = raw_input('Find all prime numbers less than... ')
    print primeslt(int(i))

if __name__ == '__main__':
    main()
