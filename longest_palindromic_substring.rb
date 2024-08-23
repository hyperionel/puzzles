require 'pry'
# Given a string s, return the longest palindromic substring in s.

# Example 1:

# Input: s = "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.

def longest_palindromic_substring(string)
  current_longest = [0, 1]

  (1..string.length - 1).each do |i|
    odd = get_longest_palindrome_from(string, i - 1, i + 1)
    even = get_longest_palindrome_from(string, i - 1, i)

    longest = [odd, even].max_by { |arr| arr[1] - arr[0] }
    current_longest = [longest, current_longest].max_by { |arr| arr[1] - arr[0] }
  end

  string[current_longest[0]..current_longest[1] - 1]
end

def get_longest_palindrome_from(string, left_idx, right_idx)
  while left_idx >= 0 && right_idx < string.length
    break if string[left_idx] != string[right_idx]
    left_idx -= 1
    right_idx += 1
  end

  return [left_idx + 1, right_idx]
end

# O(n^2) time | O(1) space