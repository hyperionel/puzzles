require 'pry'

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

$a = ListNode.new(-9, nil)
$b = ListNode.new(5, nil)
$a.next = ListNode.new(3, nil)
$b.next = ListNode.new(7, nil)

# In place
# Time O(n) | Space O(1)
def merge_two_lists(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?
  l1_current = l1
  l1_prev = nil
  l2_current = l2
  head = l1

  while !l2_current.nil?
    if l2_current.val <= l1_current.val
      l2_copy = l2_current.dup
      
      if head == l1_current
        l2_copy.next = l1_current
        head = l2_copy
      else
        l1_prev.next = l2_copy
        l2_copy.next = l1_current
      end

      l1_prev = l2_copy
      l2_current = l2_current.next
    else
      if l1_current.next.nil?
        l1_current.next = l2_current
        l2_current = l2_current.next
        break
      end

      l1_prev = l1_current
      l1_current = l1_current.next
    end
  end
  head
end

# Recursive
def merge_two_lists(l1, l2)
  return l1 || l2 unless l1 && l2

 if l2.val > l1.val
   l1.next = merge_two_lists(l1.next, l2)
   l1
 elsif l2.next = merge_two_lists(l1, l2.next)
   l2
 end
end

# Creating sepparate list
def merge_two_lists(l1, l2)
  l3 = ListNode.new
  l3_starter = l3 
  
  while l1 && l2
    if l1.val <  l2.val
      l3.next = l1
      l1 = l1.next 
    else 
      l3.next = l2
      l2 = l2.next 
    end 
      l3 = l3.next
  end 
  
   l3.next = l2 if l2 
   l3.next = l1 if l1 
   l3_starter.next 
end