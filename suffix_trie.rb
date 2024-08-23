class SuffixTrie
  attr_accessor :root, :end_symbol

  def initialize(string)
    @root = {}
    @end_symbol = '*'
    populate_suffix_trie_from(string)
  end

  # O(n^2) time | O(n^2) space
  def populate_suffix_trie_from(string)
    (0..string.length - 1).each do |i|
      insert_substring_starting_at(i, string)
    end
  end

  def insert_substring_starting_at(i, string)
    node = @root
    (i..string.length - 1).each do |j|
      letter = string[j]
      unless node[letter]
        node[letter] = {}
      end
      node = node[letter]
    end

    node[@end_symbol] = true
  end

  # O(m) time where m is the length of the input string
  # O(1) space
  def contains?(string)
    node = @root
    string.each_char do |letter|
      return false unless node[letter]
      node = node[letter]
    end

    node[@end_symbol] ? true : false
  end
end