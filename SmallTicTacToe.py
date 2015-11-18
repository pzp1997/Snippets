import numpy as np
b,t=np.zeros((3,3)),1
check_winners=lambda b,p:(any(all(r==p)for r in b)or any(all(b[:,c]==p)for c in xrange(b.shape[1]))or all(b[i,i]==p for i in xrange(min(b.shape)))or all(b[i,min(b.shape)-i-1]==p for i in xrange(min(b.shape))))
def vi(f,p):
    i=raw_input(p)
    while not f(i):i=raw_input(p)
    return i
while True:
    print '\n'.join(' '.join(list(' XO')[int(i)]for i in r)for r in b)
    c=divmod(int(vi(lambda s:s in list('123456789'),'Cell (1-9): '))-1,min(b.shape))
    if b[c]==0:
        b[c]=t
        if check_winners(b,t):
            print "{} wins!".format(('X','O')[t-1])
            break
        t=t%2+1
