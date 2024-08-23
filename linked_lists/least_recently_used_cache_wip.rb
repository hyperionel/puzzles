# WIP
class Node
  attr_accessor :next, :prev, :val

  def initialize(key=nil, val=nil, _next=nil, prev=nil)
    @key = key
    @val = val
    @next = _next
    @prev = prev
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def set_head(node)
    if @head.nil?
      @head = node
      @tail = node
      return
    end
    insert_before(@head, node)
  end

  def set_tail(node)
    if @tail.nil?
      set_head(node)
      return
    end
    insert_after(@tail, node)
  end
  
  def insert_before(node, node_to_insert)
    return if node_to_insert == @head && node_to_insert == @tail

    remove(node_to_insert)
    node_to_insert.prev = node.prev
    node_to_insert._next = node

    if node.prev.nil?
      @head = node_to_insert
    else
      node.prev._next = node_to_insert
    end
    node.prev = node_to_insert
  end

  def insert_after(node, node_to_insert)
    return if node_to_insert == @head && node_to_insert == @tail

    remove(node_to_insert)
    node_to_insert.prev = node
    node_to_insert.next = node.next

    if node.next.nil?
      @tail = node_to_insert
    else
      node.next.prev = node_to_insert
    end
    node.next = node_to_insert
  end
      
  def remove(node)
    @head = @head.next if node == @head
    @tail = @tail.prev if node == @tail

    remove_node_bindings(node)
  end
      
  def remove_node_bindings(node)
    node.prev.next = node.next if !node.prev.nil?
    node.prev = nil
    node.next.prev = node.prev if !node.next.nil?
    node.next = nil
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @linked_list = DoublyLinkedList.new()
    @order_hash = {}
    @result = [nil]
  end

  def get(key)
    @result.append(@order_hash[key] ? key : -1)

    node = order_hash[key]
    @linked_list.insert_after(@linked_list.tail, node) if node
  end

  def put(key, value)
    if @order_hash[key]
      node = order_hash[key]
      node.val = value
      @linked_list.insert_after(@linked_list.tail, node)
    else
      node = Node.new(key, value) 
      if @order_hash.keys.length == @capacity
        head = @linked_list.head
        @order_hash.delete(head.val)
        @linked_list.remove(@linked_list.head)
      end

      @order_hash[key] = node
      @linked_list.set_tail(node)
    end
      
    @result.append(nil)
  end
end


a = LRUCache.new(2);
a.put(1, 1);
a.put(2, 2);
a.get(1);
a.put(3, 3);
a.get(2);   
a.put(4, 4);
a.get(1);
a.get(3);
binding.pry
a.get(4);