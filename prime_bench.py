# -*- coding: utf-8 -*-

import sys

def count_prime(size):
    total = 0
    flags = [True] * size
    flags[0] = flags[1] = False;
    for s in xrange(2, size / 2):
        if flags[s]:
            total = total + 1
            for s2 in xrange(s * 2, size, s):
                flags[s2] = False
    for s in xrange(s + 1, size):
        if flags[s]:
            total = total + 1
    return total;

if len(sys.argv) < 2:
    print("python " + sys.argv[0] + " size [count]")
    sys.exit(1)
size = int(sys.argv[1])
if size < 1:
    print("python " + sys.argv[0] + " size [count]")
    sys.exit(1)
count = 1 if len(sys.argv) < 3 else int(sys.argv[2])
total = 0
for c in xrange(0, count):
    total = count_prime(size)
print("prime count = " + str(total))


