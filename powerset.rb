# P([1, 2, 3]) = [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

# Iterative
# O (n * 2^n) time | O (n * 2^n) space
def powerset(array)
  subsets = [[]]

  array.each do |elem|
    (1..subsets.length - 1).each do |i|
      current_subset = subsets[i]
      subsets.append(current_subset + [elem])
    end
  end

  return subsets
end

# Recursive
# O (n * 2^n) time | O (n * 2^n) space
def powerset(array, index = nil)
  if index.nil?
    index = array.length - 1
  elsif index < 0
    return [[]]
  end

  ele = array[index]
  subsets = power(array, index - 1)
  (0..subsets.length - 1).each do |i|
    current_subset = subsets[i]
    subsets.append(current_subset + [ele])
  end

  subsets
end