# str1 = "abc"
# str2 = "yabd"
# Minimum number of operations to convert str1 -> str2
# Output: 2 ( INSERT "y", SUBSTITUTE "c" for "d")

# O(n*m) time, O(n*m) space

def levenshtein_distance(str1, str2)
  edits = Array.new(str2.length + 1, Array(0..str1.length + 1))

  # initialize with 1 "operation" the first column representing the first letter after the empty string
  (1..str2.length + 1).each do |i|
    edits[i][0] = edits[i - 1][0] + 1
  end

  (1..str2.length + 1).each do |i|
    (1..str1.length + 1) .each do |j|
      if str2[i - 1] == str[j - 1]
        edits[i][j] = edits[i - 1][j - 1]
      else
        edits[i][j] = 1 + [edits[i - 1][j - 1], edits[i][j - 1], edits[i - 1][j]].min
      end
    end
  end

  return edits[-1][-1]
end

# O(n*m) time, O(min(n, m)) space

def levenshtein_distance(str1, str2)
  small = str1.length < str2.length ? str1 : str2
  big = str1.length >= str2.length  ? str1 : str2

  even_edits = Array(0..small.length + 1)
  odd_edits = Array.new(small.lenghth + 1, nil)

  (1..big.length + 1).each do |i|
    if i % 2 == 1
      current_edits = odd_edits
      previous_edits = even_edits
    else
      current_edits = even_edits
      previous_edits = odd_edits
    end

    current_edits[0] = i
    (1..small.length + 1).each do |j|
      if big[i - 1] == small[j - 1]
        current_edits[j] = previous_edits[j - 1]
      else
        current_edits[j] = 1 + [previous_edits[j - 1], previous_edits[j], current_edits[j - 1]].min
      end
    end
  end

  big.length % 2 == 0 ? even_edits[-1] : odd_edits[-1]
end

