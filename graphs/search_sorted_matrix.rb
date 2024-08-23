# [1,    4,    7,   12,    15,   1000]
# [2,    5,   19,   31,    32,   1001]
# [3,    8,   24,   33,    35,   1002]
# [40,  41,   42,   44,    45,   1003]
# [99, 100,  103,  106,   128,   1004]
# target = 44
# Output: [3, 3]

def search_sorted_matrix(array, target)
  row = 0
  col = matrix[0].length - 1

  while row < array.length && col >= 0
    if matrix[row][col] > target
      col -= 1
    elsif matrix[row][col] < target
      row += 1
    else
      return [row, col]
    end
  end

  return [-1, -1]
end

# O(n+m) time where n is the len of rows and m is the len of col's
# O(1) space