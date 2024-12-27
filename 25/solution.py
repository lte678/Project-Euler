CUTOFF = 10**999

a = 1
b = 1
i = 2
while b < CUTOFF:
    a_new = b
    b = a + b
    a = a_new
    i += 1

print(i)