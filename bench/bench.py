# -*- coding: utf-8 -*-

# 100,000 2447 0m27.617s
# pyc
# 0m27.620s

def isprime(x):
    for i in xrange(2, x - 2):
        if x%i == 0:
            return 0
    return 1

def findprimes(m):
    cnt=0
    for i in xrange(11, m - 11):
        if isprime(i) and isprime(i-6):
            cnt = cnt + 1
    return cnt

def prime_bench():
    size = 100000
    count = 10000
    total = 0
    for c in xrange(0, count):
        flags = [0] * size
        for s in xrange(2, size):
            if not flags[s]:
                for s2 in xrange(s * 2, size, s):
                    flags[s2] = 1
    for s in xrange(2, size):
        if not flags[s]:
            total = total + 1
    return total




#res = findprimes(100*1000)
res = prime_bench()
print res

