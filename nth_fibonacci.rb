# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
# fib(n) = fib(n-1) + fib(n - 2) for n > 2

# Recursive - yuge time complexity / brute force
# O(2.pow(n)) time

def fib(n)
  return 1 if n == 2
  return 0 if n == 1

  fib(n-1) + fib(n-2)
end

# Recursive with memoizations/caching
# O(n) time | O(n) space

def fib(n, memoized = {1 => 0, 2 => 1})
  memoized[n] = fib(n-1, memoized) + fib(n-2, memoized) unless memoized[n]
  memoized[n]
end

# Iterative
# O(n) time | O(1) space

def fib(n)
  last_two = [0, 1]
  counter = 3

  while counter <= n
    next_fib = last_two[0] + last_two[1]
    last_two[0] = last_two[1]
    last_two[1] = next_fib
    counter += 1
  end

  n > 1 ? last_two[1] : last_two[0]
end