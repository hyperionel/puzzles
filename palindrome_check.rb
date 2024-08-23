# Palindrome check
# e.g:  abcdcba

# O(n^2) time | O(n) space
# new string var

def is_palindrome?(string)
  reversed_string = ''

  (string.size..0).each do |i|
    reversed_string += string[i]
  end

  return string == reversed_string
end

# O(n) time | O(n) space
# new arr var

def is_palindrome?(string)
  reversed_chars = []

  (string.size..0).each do |i|
    reversed_chars.append(string[i])
  end

  return string == reversed_chars.join('')
end


# O(n) time | O(n) space
# recursion

def is_palindrome?(string)
  is_palindrome_helper(string, i = 0)
end

def is_palindrome_helper(string, i)
  j = len(string) - 1 - i

  return true if i >= j
  string[i] == string[j] && is_palindrome_helper(string, i + 1)
end

# O(n) time | O(1) space
# iterative

def is_palindrome(string)
  left_index = 0
  right_index = string.size - 1

  while left_index < right_index
    if string[left_index] != string[right_index]
      return false
    else
      left_index += 1
      right_index -= 1
    end
  end

  return true
end