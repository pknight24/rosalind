import sys

def dh(a, b):
    count = 0
    for i in range(len(a)):
        if (a[i] != b[i]):
            count += 1
    return count

with open(sys.argv[1], "r") as f:
    text = f.read().strip()
    strands = text.split('\n')
    print(dh(strands[0], strands[1]))
