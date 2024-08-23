# Given a string, write a function to check if it is a permutation of a palindrome
# Input: "Tact Coa"
# True (permutations: "taco cat", "atco cta", etc.)

def check_palindrom_permutations(string)
  workable_string = string.delete(' ')

  char_count_hash = {}

  workable_string.each_char do |char|
    if char_count_hash[char]
      char_count_hash[char] += 1
    else
      char_count_hash[char] = 1
    end
  end

  too_many_odd_char_counts = false
  char_count_hash.values.each do |count|
    if count % 2 != 0
      return false if too_many_odd_char_counts
      too_many_odd_char_counts = true
    end
  end

  true
end