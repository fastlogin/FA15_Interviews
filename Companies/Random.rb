# Given a bag of coins and a value return how many ways there are to make
# that value with the coins in the bag.
def num_ways_coins(coins,target)
	sum_to_val_two(coins,target)
end

def sum_to_val(vals,target)
	puts(vals.to_s)
	return 0 if target < 0
	return 1 if target == 0
	return 0 if vals.size == 0
	ans = 0
	(0..vals.size-1).each do |i|
		ans += sum_to_val(vals[i+1..vals.size-1],target-vals[i])
	end
	return ans
end

def sum_to_val_two(vals,target)
	return 0 if target < 0
	return 1 if target == 0
	return 0 if vals.size == 0
	ans = 0
	(0..vals.size-1).each do |i|
		ans += sum_to_val_two(vals[i..vals.size-1],target-vals[i])
	end
	return ans
end