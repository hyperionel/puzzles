# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

def longest_common_prefix(strs)
  return '' if strs.empty?
  longest = ''
  current_idx = 0
  current_letter = strs[0][current_idx]
  prefix_found = true
    
  while true
    strs.each do |str|
      return longest if str[current_idx] != current_letter || current_letter.nil?
    end
    
    longest << current_letter
    current_idx += 1
    current_letter = strs[0][current_idx]
  end
    
  longest
end