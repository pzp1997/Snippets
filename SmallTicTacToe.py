import numpy as np
b,t=np.zeros((3,3)),1
check_winners=lambda b,p:(any(all(r==p)for r in b)or any(all(b[:,c]==p)for c in range(b.shape[1]))or all(b[i,i]==p for i in range(min(b.shape)))or all(b[i,min(b.shape)-i-1]==p for i in range(min(b.shape))))
while True:
    print '\n'.join(' '.join(list(' XO')[int(i)]for i in r)for r in b)
    i=''
    while not i in list('123456789'):i=raw_input('Cell (1-9): ')
    c=divmod(int(i)-1,min(b.shape))
    if b[c]==0:
        b[c]=t
        if check_winners(b,t):
            print "{} wins!".format(('X','O')[t-1])
            break
        t=t%2+1
