# Given a positive integer n, you can apply one of the following operations:

# If n is even, replace n with n / 2.
# If n is odd, replace n with either n + 1 or n - 1.
# Return the minimum number of operations needed for n to become 1.

def integer_replacement(n)
  op_counter = 0
  return integer_replacement_helper(n, op_counter)
end

# Time O(n) | Space O(n)
def integer_replacement_helper(n, op_counter)
  return op_counter if n == 1
  op_counter += 1

  if n % 2 == 0
    n = n / 2
    op_counter = integer_replacement_helper(n, op_counter)
  else
    plus_count = integer_replacement_helper(n + 1, op_counter)
    minus_count = integer_replacement_helper(n - 1, op_counter)

    op_counter = plus_count < minus_count ? plus_count : minus_count
  end

  return op_counter
end

# Dumb math solution that you will definitely remember in an interview
# O(log n) | O(1)

def integer_replacement(n)
  counter = 0

  while n > 1
    counter += 1

    if n % 2 == 0
      n = n / 2
    elsif n % 4 == 1 || n == 3
      n -= 1
    else
      n += 1
    end
  end

  counter
end