# [1, 0, 0, 1, 0]
# [1, 0, 1, 0, 0]
# [0, 0, 1, 0, 1]
# [1, 0, 1, 0, 1]
# [1, 0, 1, 1, 0]

# Output: [1, 2, 2, 2, 5]

def river_sizes(matrix)
  sizes = []
  visited = Array.new(matrix.length, Array.new(matrix[0].length, false))

  (0..matrix.length - 1).each do |i|
    (0..matrix[i].length - 1).each do |j|
      next if visited[i][j]
      traverse_node(i, j, matrix, visited, sizes) 
    end
  end

  sizes
end

def traverse_node(i, j, matrix, visited, sizes)
  current_river_size = 0
  # stack - LIFO
  nodes_to_explore = [[i, j]]

  while nodes_to_explore.any?
    current_node = nodes_to_explore.pop
    i = current_node[0]
    j = current_node[1]
    
    next if visited[i][j]
    visite[i][j] = true

    next if matrix[i][j] == 0

    current_river_size += 1
    unvisited_neighbours = get_unvisited_neighbours(i, j, matrix, visited)
    unvisited_neighbours.each do |neighbour|
      nodes_to_explore.append(neighbour)
    end
  end

  sizes.append(current_river_size) if current_river_size > 0
end

def get_unvisited_neighbours(i, j, matrix, visited)
  unvisited_neighbours = []
  unvisited_neighbours.append([i - 1, j]) if i > 0 && !visited[i-1][j]
  unvisited_neighbours.append([i + 1, j]) if i < matrix.length - 1  && !visited[i + 1][j]
  unvisited_neighbours.append([i, j - 1]) if j > 0 && !visited[i][j - 1]
  unvisited_neighbours.append([i, j + 1]) if j < matrix[0].length - 1 && !visited[i][j + 1]
  unvisited_neighbours
end

# O(wh) time | O(wh) space