# Given a bag of coins and a value return how many ways there are to make
# that value with the coins in the bag.
def num_ways_coins(coins,target)
	puts(target)
	return 0 if target < 0
	return 1 if target == 0
	return 0 if coins.size == 0
	ans = 0
	(0..coins.size-1).each do |i|
	curr = coins.dup
	curr.delete_at(i)
		ans += num_ways_coins(curr,target-coins[i])
	end
	return ans
end