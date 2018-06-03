import sys

with open(sys.argv[1], "r") as f:
    a = 0
    t = 0
    g = 0
    c = 0
    for base in f.read():
        if (base == "A"):
            a += 1
        elif (base == "G"):
            g += 1
        elif (base == "T"):
            t += 1
        elif (base == "C"):
            c += 1

    print(a, c, g, t)

