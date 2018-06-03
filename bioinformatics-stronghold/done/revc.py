import sys

with open(sys.argv[1], "r") as f:
    text = f.read()
    text = text.strip()
    revers = text[::-1]
    newstrand = []
    for b in revers:
        if (b == "A"):
            newstrand.append("T")
        elif (b == "T"):
            newstrand.append("A")
        elif (b == "G"):
            newstrand.append("C")
        else:
            newstrand.append("G")
    print(''.join(newstrand))
