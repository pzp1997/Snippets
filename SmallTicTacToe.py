import numpy
s,b,t=3,numpy.zeros((3,3)),1
while 1:
    print '\n'.join(' '.join(' XO'[int(i)]for i in r)for r in b)
    i=''
    while i not in map(str,range(1,s**2+1)):i=raw_input("Cell (1-%s): "%s**2)
    c=divmod(int(i)-1,s)
    if b[c]==0:
        b[c]=t
        if any(all(r==t)for r in b)or any(all(b[:,c]==t)for c in range(s))or all(b[i,i]==t for i in range(s))or all(b[i,s-i-1]==t for i in range(s)):
            print 'XO'[t-1]+" wins!"
            break
        if (b!=0).all():
            print "Tie!"
            break
        t=t%2+1
