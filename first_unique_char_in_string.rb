# Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

# Example 1:

# Input: s = "leetcode"
# Output: 0
# Example 2:

# Input: s = "loveleetcode"
# Output: 2
# Example 3:

# Input: s = "aabb"
# Output: -1

def first_uniq_char(s)
  return -1 if s.empty?
  char_hash = Hash.new(0)
  
  s.each_char do |char|
      char_hash[char] += 1
  end
  
  unique_char = char_hash.key(1)
  unique_char ? s.index(unique_char) : -1
end