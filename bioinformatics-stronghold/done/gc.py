import sys

def gc(dna):
    count = 0
    for base in dna:
        if (base == "G" or base == "C"):
            count += 1
    return count / len(dna)

with open(sys.argv[1], "r") as f:
    text = f.read().strip()
    lines = text.split('>')[1:]
    gc_values = {}
    for strand in lines:
        pieces = strand.split('\n')
        name = pieces[0]
        data = pieces[1:]
        dna = ''.join(data)
        gc_values[name] = gc(dna)
    biggest = 0
    bigname = ""
    for key, val in gc_values.items():
        if (val > biggest):
            biggest = val
            bigname = key

    print(bigname)
    print(biggest * 100)


