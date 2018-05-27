import sys

with open(sys.argv[1], "r") as f:
    rna = []
    for base in f.read():
        if (base == "T"):
            rna.append("U")
        else:
            rna.appen(base)
    print(rna.join(""))
