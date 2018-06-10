import sys

# A type pairs - homo dom x homo dom -> 4 dom
# B type pairs - homo dom x hetero -> 4 dom
# C type pairs - homo dom x homo rec -> 4 dom
# D type pairs - hetero x hetero -> 3 dom
# E type pairs - hetero x homo rec -> 2 dom
# F type pairs - homo rec x homo rec -> 0 dom

def pairs(n):
    return (n * (n - 1)) / 2

with open(sys.argv[1], "r") as f:
    text = f.read().strip()
    nums = text.split(" ")
    k = int(nums[0])
    m = int(nums[1])
    n = int(nums[2])
    total = k + m + n
    possible_pairs = pairs(total)
    possible_offspring = possible_pairs * 4
    A = pairs(k)
    D = pairs(m)
    F = pairs(n)
    B = pairs(k + m) - A - D
    C = pairs(k + n) - A - F
    E = pairs(m + n) - D - F
    total_dom = A * 4 + B * 4 + C * 4 + D * 3 + E * 2
    percent_dom = (total_dom / possible_offspring) 


    print (percent_dom)

