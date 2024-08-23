# $6
# [1, 2, 4]

def min_number_coins_change(n, denoms)
  num_of_coins = Array.new(n + 1, Float::INFINITY)
  num_of_coins[0] = 0

  denoms.each do |denom|
    (0..num_of_coins.length).each do |amount|
      if denom <= amount
        num_of_coins[amount] = [num_of_coins[amount], 1 + num_of_coins[amount - denom]]
      end
    end
  end

  num_of_coins[n] != Float::INFINITY ? num_of_coins[n] : -1
end

# O(n*d) time where d is the nr of denominations
# O(n) space