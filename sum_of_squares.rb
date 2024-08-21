# Implement a method that returns the sum of the squares of all even numbers in an array.

def sum_of_squares_of_evens(arr)
  arr.select { |num| num.even? }  # Select only even numbers
     .map { |num| num**2 }        # Square each even number
     .sum                        # Sum all the squared numbers
end
