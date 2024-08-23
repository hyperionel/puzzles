# [7, 6, 4, -1, 1, 2], 16
# Output: [[7, 6, 4, -1], [7, 6, 1, 2]]

# O(n^2) time | O(n^2) space
def four_number_sum(array, target_sum)
  all_pair_sums = {}
  quadruplets = []

  (1..array.length - 2).each do |i|
    (i + 1, array.length - 1).each do |j|
      current_sum = array[i] + array[j]
      difference = target_sum - current_sum

      if all_pair_sums[difference]
        all_pair_sums[difference].each do |pair|
          quadruplets.append(pair + [array[i], array[j]])
        end
      end
    end

    (0..i - 1).each do |k|
      current_sum = array[i] + array[k]
      unless all_pair_sums[current_sum]
        all_pair_sums[current_sum] = [array[k], array[i]]
      else
        all_pair_sums[current_sum].append([array[k], array[i]])
      end
    end
  end

  quadruplets
end