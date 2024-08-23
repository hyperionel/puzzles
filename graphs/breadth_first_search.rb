#                   A
#                 / | \
#               B   C   D
#              / \     / \
#             E   F   G   H
#                / \   \
#               I   J   K
#
# Output: [A, B, C, D, E, F, G, H, I, J, K]

class Node
  attr_accessor :children, :name
  
  def initialize(name)
    @name = name
    @children = []
  end

  def add_child(name)
    @children.append(Node.new(name))
  end

  # O(v + e) time where v is the nr of vertices and e is the nr of edges
  # O(v) space
  def breadth_first_search(array)
    # queue FIFO
    queue = [self]

    while queue.any?
      current = queue.shift
      array.append(current.name)

      queue.append(*current.children)
    end

    array
  end
end