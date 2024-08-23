# ['yo', 'act', 'flop', 'tac', 'cat', 'oy', 'olfp']
# Output: [['yo', 'oy'], ['act', 'cat', 'tac'], ['flop', 'oflp']]

# Sol 1
# O(w*n*log(n) + n*w*log(w)) | O(wn) space
def group_anagrams(words)
  return [] unless words.any?
  sorted_words = words.map { |word| word.chars.sort.join }
  indices = Array(0..words.length)
  indices.sort_by!{ |i| sorted_words[i] }

  result = []
  current_anagram_group = []
  current_anagram = sorted_words[indices[0]]
  
  indices.each do |index|
    word = words[index]
    sorted_word = sorted_words[index]

    if sorted_word == current_anagram
      current_anagram_group.append(word)
      continue
    end

    result.append(current_anagram_group)
    current_anagram_group = [word]
    current_anagram = sorted_word
  end

  result.append(current_anagram_group)
  result
end

# Sol 2
#  O(w*n*log(n)) | O(wn) space
def group_anagrams
  anagrams = {}

  words.each do |word|
    sorted_word = word.chars.sort.join
    if anagrams[sorted_word]
      anagrams[sorted_word].append(word)
    else
      anagrams[sorted_word] = [word]
    end
  end

  return anagrams.values
end