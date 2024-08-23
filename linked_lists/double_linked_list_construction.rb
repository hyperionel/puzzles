class DoublyLinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
  end

  # O(1) time | O(1) space
  def set_head(node)
    if @head.nil?
      @head = node
      @tail = node
      return
    insert_before(@head, node)
  end

  # O(1) time | O(1) space
  def set_tail(node)
    if @tail.nil?
      set_head(node)
      return
    insert_after(@tail, node)
  end

  # O(1) time | O(1) space
  def insert_before(node, node_to_insert)
    return if node_to_insert == @head && node_to_insert == @tail

    # update bindings on the node we are gonna insert
    remove(node_to_insert) # in case the node already exists somewhere else in the list we need to remove it first
    node_to_insert.prev = node.prev
    node_to_insert.next = node

    # update bindings on surronding nodes
    if node.prev.nil?
      @head = node_to_insert
    else
      node.prev.next = node_to_insert
    end
    node.prev = node_to_insert


  end

  # O(1) time | O(1) space
  def insert_after(node, node_to_insert)
    return if node_to_insert == @head && node_to_insert == @tail

    # update bindings on the node we are gonna insert
    remove(node_to_insert) # in case the node already exists somewhere else in the list we need to remove it first
    node_to_insert.prev = node
    node_to_insert.next = node.next

    # update bindings on surrounding nodes
    if node.next.nil?
      @tail = node_to_insert
    else
      node.next.prev = node_to_insert
    end
    node.next = node_to_insert
  end

  # O(p) time - depending on position | O(1) space
  def insert_at_position(position, node_to_insert)
    if position == 1
      set_head(node_to_insert)
      return

    node = @head
    current_pos = 1

    while !node.nil? && current_pos != position
      node = node.next
      current_pos += 1
    end

    if !node.nil?
      insert_before(node, node_to_insert)
    else
      set_tail(node_to_insert)
    end
  end

  # O(n) time | O(1) space
  def remove_nodes_with_value(value)
    node = @head

    while !node.nil?
      node_to_remove = node
      node = node.next
      remove_node(node) if node_to_remove.value == value
    end
  end

  # O(1) time | O(1) space
  def remove(node)
    @head = @head.next if node == @head
    @tail = @tail.prev if node == @tail

    remove_node_bindings(node)
  end

  # O(n) time | O(1) space
  def contains_node_with_value?(value)
    node = self.head

    while !node.nil? && node.value != value
      node = node.next
    end

    !node.nil?
  end

  def remove_node_bindings(node)
    node.prev.next = node.next if !node.prev.nil?
    node.prev = nil
    node.next.prev = node.prev if !node.next.nil?
    node.next = nil
  end
end

class Node
  attr_accessor :next, :prev

  def initialize(next = nil, prev = nil)
    @next = next
    @prev = prev
  end
end