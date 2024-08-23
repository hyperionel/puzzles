# [5, 2, [7, -1], 3, [6, [-13, 8], 4]]
# the sum of all elements in the array multiplied by the level of nesting in the array (e.g calc of 2nd array in example will be (7 - 1) * 2)

def product_sum(array, multiplier = 1)
  sum = 0
  array.each do |elem|
    if elem.is_a?(Array)
      sum += product_sum(elem, multiplier + 1)
    else
      sum += elem
    end
  end

  sum * multiplier
end

# O(n) time where n is the number of all elements in array
# O(d) space where d is the depth of the subarrays