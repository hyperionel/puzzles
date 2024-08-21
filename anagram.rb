# Write a method to check if two strings are anagrams of each other.

def anagram(str1, str2)
  str1 = str1.downcase.trim
  str2 = str2.downcase.trim

  str1.chars.sort == str2.chars.sort
end

anagram("aboba", "aboab")
