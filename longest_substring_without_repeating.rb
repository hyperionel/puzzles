require 'pry'
# Given a string s, find the length of the longest substring without repeating characters.

# Example 1:

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# BRUTE FORCE NOOB ATTEMPT
# Turns out to be ok-ish
# TODO look for improvements
# O(n) time | O(n) space
def longest_substring(string)
  return 0 if string == ''
  return 1 if string.length == 1
  
  current_string_chars = {}
  current_index = 0
  unique_chars = 0
  max_unique_chars = 0

  while current_index <= string.length - 1
    if current_string_chars[string[current_index]]
      current_index = current_string_chars[string[current_index]] + 1
      current_string_chars = {}
      unique_chars = 0
    else
      current_string_chars[string[current_index]] = current_index
      current_index += 1
      unique_chars += 1
    end

    max_unique_chars = unique_chars if unique_chars > max_unique_chars
  end

  max_unique_chars
end