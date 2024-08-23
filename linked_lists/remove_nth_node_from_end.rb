# 0 -> 1 -> 2 -> 3 -> 4 -> 5 ... -> 9, 4

# O(N) time where N is the size of the linked list | O(1) space
def remove_nth_node_from_head(head, node)
  first = head
  second = head

  counter = 1

  while counter <= n
    second = second.next
    counter += 1
  end

  if second.nil?
    head.value = head.next.value
    head.next = head.next.next
    return
  end
  
  while !second.next.nil?
    second = second.next
    first = first.next
  end

  first.next = first.next.next
end