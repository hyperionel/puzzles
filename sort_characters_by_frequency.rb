# Given a string s, sort it in decreasing order based on the frequency of characters, and return the sorted string.

# Example 1:

# Input: s = "tree"
# Output: "eert"
# Explanation: 'e' appears twice while 'r' and 't' both appear once.
# So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

def frequency_sort(s)
  char_hash = {}

  s.each_char do |char|
    if char_hash[char]
      char_hash[char] += 1
    else
      char_hash[char] = 1
    end
  end

  result = ''
  char_hash.sort_by { |k, v| -v }.each do |char, char_count|
    char_count.times do
      result << char
    end
  end

  result
end