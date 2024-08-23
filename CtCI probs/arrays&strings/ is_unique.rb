# Implement and algorithm to determine if a string has all unique characters
# What if you cannot use additional data structures?

# With data structures
# O(n) time | O(n) space
def is_unique?(string)
  char_hash = {}

  string.each_char do |char|
    if char_hash[char]
      return false
    else
      char_hash[char] = true
    end
  end

  true
end

# Without data structures & with sort
# O(n*log(n)) time | O(1) space
def is_unique?(string)
  sorted_str = string.chars.sort.join

  (0..string.length - 1) do |i|
    return false if string[i] == string[i + 1]
  end

  true
end