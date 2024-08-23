# $10, [1, 5, 10, 25]
# Output: 4 ways to make change
# 1 * 10
# 2 * 5
# 1 * 5 + 5 * 1
# 10 * 1

def number_of_ways_to_make_change(n, denoms)
  ways = Array.new(n + 1, 0)
  ways[0] = 1

  denoms.each do |denom|
    (1..n + 1).each do |amount|
      if denom <= amount
        ways[amount] += ways[amount - denom]
      end
    end
  end

  return ways[n]
end