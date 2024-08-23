# a -> b -> c -> d -> None
# d -> c -> b -> a -> None

def reverse_linked_list(head)
  current = head
  previous = nil

  while true

    break if current.next.nil?

    # switch link direction
    tmp_curr = current.next
    current.next = previous

    # change values for the next nodes
    previous = current
    current = tmp_curr
  end
end

