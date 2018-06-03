import sys

def fib(n, k):
    if (n==1 or n == 2):
        return 1
    else:
        return fib(n-1, k) + k * fib(n-2, k)
with open(sys.argv[1], "r") as f:
    text = f.read().strip()
    nums = text.split(" ")
    n = int(nums[0])
    k = int(nums[1])
    print(fib(n, k))


