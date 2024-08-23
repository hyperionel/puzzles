# Given 2 strings, write a method to decide if 1 is a permutation of the other

# Sol 1 - Hash table
# O(n) time | O(n) space
def is_permutation?(str1, str2)
  return false unless str1.length == str2.length
  
  char_hash = {}
  str1.each { |char| char_hash[char] = 0 }

  str2.each_char do |char|
    if char_hash[char]
      char_hash[char] += 1
    else
      return false
    end
  end

  char_hash.values.max == 1
end

# Sol 2 - Sorting
# O(n*log(n)) time | O(1) space
def is_permutation?(str1, str2)
  return false unless str1.length == str2.length
  
  sorted_str1 = str1.chars.sort.join
  sorted_str2 = str2.chars.sort.join

  (0..str1.length - 1).each do |i|
    return false unless sorted_str1[i] == sorted_str2[i]
  end

  true
end
