# Caesar Cypher

O(n) time | O(n) space

def caesar_cypher(string, key)
  new_letters = []
  new_key = key % 26

  string.each do |letter|
    new_letters.append(get_new_letter(letter, new_key))
  end

  return new_letters.join('')
end

def get_new_letter(letter, key)
  new_letter_code = letter.ord + key

  if new_letter_code <= 122
    return new_letter_code.chr
  else
    return (96 + new_letter_code % 122).chr
  end
end

# O(n) time | O(n) space

def caesar_cypher(string, key)
  new_letters = []
  new_key = key % 26
  alphabet = ('a'..'z').to_a

  string.each do |letter|
    new_letters.append(get_new_letter(letter, new_key, alphabet))
  end

  return new_letters.join('')
end

def get_new_letter(letter, key, alphabet)
  new_letter_code = alphabet.index(letter) + key

  if new_letter_code <= 25
    return alphabet[new_letter_code]
  else
    return alphabet[-1 + new_letter_code % 25]
  end
end