def isOdd(n):
    return n % 2 == 1

def summOdds(a, b):
    sum = 0
    for i in range(a, b+ 1):
        if (isOdd(i)):
            sum += i
    return sum

print(summOdds(4986, 9652))
