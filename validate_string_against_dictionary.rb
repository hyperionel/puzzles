require 'pry'
# string = "Practice makes perfect."
# dictionary = ['practice', 'makes', 'perfect']

# O(nxm) time where n is the length of the dictionary and m is the number of words in the string
# O(n + m) space
# def valid_string?(str, dict)
#   sanitized_str = string.scan(/[a-z\s]/).join
#   dict_hash = {}
  
#   dictionary.each { |word| dict_hash[word] = true }

#   sanitized_str.split(' ').each do |word|
#     return false unless dict_hash[word]
#   end

#   return true
# end

# string = "practicemakesperfect"
# dictionary = ['practice', 'makes', 'perfect']

def valid_string?(str, dict)
  current_str = str
  current_word_idx = 0
  current_dict_word_idx = 0
  word_found = false
  
  until current_str.empty?
    dict_word = dict[current_dict_word_idx]
    
    dict_word.each_char do |word_char|
      if word_char != current_str[current_word_idx]
        word_found = false
        current_word_idx = 0
        break
      end
      current_word_idx += 1
      word_found =  true
    end

    if current_dict_word_idx == dict.length - 1 && !word_found
      return false
    end

    current_dict_word_idx += 1
    
    if word_found
      current_str.slice!(0, current_word_idx)
      current_dict_word_idx = 0
      current_word_idx = 0
    end
  end

  true
end