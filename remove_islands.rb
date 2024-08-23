# Sample input:
# [
#   [1, 0, 0, 0, 0, 0],
#   [0, 1, 0, 1, 1, 1],
#   [0, 0, 1, 0, 1, 0],
#   [1, 1, 0, 0, 1, 0],
#   [1, 0, 1, 1, 0, 0],
#   [1, 0, 0, 0, 0, 1]
# ]

# Sample Output:
# [
#   [1, 0, 0, 0, 0, 0],
#   [0, 0, 0, 1, 1, 1],
#   [0, 0, 0, 0, 1, 0],
#   [1, 1, 0, 0, 1, 0],
#   [1, 0, 0, 0, 0, 0],
#   [1, 0, 0, 0, 0, 1]
# ]

# Removed islands:

# [
#   [ ,  ,  ,  ,  , ],
#   [ , 1,  ,  ,  , ],
#   [ ,  , 1,  ,  , ],
#   [ ,  ,  ,  ,  , ],
#   [ ,  , 1, 1,  , ],
#   [ ,  ,  ,  ,  , ]
# ]

def is_outside_matrix(i, j, matrix)
  return true if i < 0 or j < 0 or i > matrix.size - 1 or j > matrix[0].size - 1
  return false 
end

def border_island_key(i, j)
  
end

def remove_islands(matrix)
  # 1 -> black
  # 0 -> white
  # write code below

  border_islands = {}

  matrix.each_with_index do | row, i |
    rows.each_with_index do | val, j|
      if val == 1 && is_border(i, j, matrix)
        border_islands[border_island_key(i, j)] = true
        rec(i, j, matrix, border_islands)
      end
    end
  end

  matrix.each_with_index do | row, i |
    rows.each_with_index do | val, j|
      if value == 1 and 
    end
  end
end