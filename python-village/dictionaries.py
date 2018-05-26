import sys

with open(sys.argv[1], "r") as f:
    counts = {}
    string = f.readline()
    words = string.split(" ")
    for w in words:
        if w not in counts:
            counts[w] = 1
        else:
            counts[w] += 1
    for key, val in counts.items():
        print(key + " " + str(val))
