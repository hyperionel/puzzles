# depth-first search algorithm in a graph
#      A
#    / | \
#   B  C  D
#  / \     \
# E   F     G

class Node
  attr_accessor :children, :name

  def initialize(name)
    @children = []
    @name = name
  end

  def add_child(name)
    @children.append(Node.new(name))
  end

  def depth_first_search(array)
    array.append(@name)

    @children.each do |child|
      child.depth_first_search(array)
    end

    array
  end
end

# Complexity: O(vertices + edges) time | O(vertices) space 
