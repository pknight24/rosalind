import sys
linenum = 0
infile = sys.argv[1]
with open(infile, "r") as f:
    for line in f:
        linenum += 1
        if (linenum % 2 == 0):
            print (line)


