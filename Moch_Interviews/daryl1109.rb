
# Return the nth c-say sequence.
def csay(n)
	return [1] if n == 1
	prev = csay(n-1)
	curr = []
	(1..prev.size-1).each do |i|
		ans =  1
		j = i + 1
		while prev[j] == prev[i] do
			ans += 1
			j += 1
		end
		curr.push(ans)
		curr.push(prev[i])
	end
	return curr
end

# Given a list of words of equal length return another list using the given list's 
# character index distribution.
def prob_word_dist(arr)
	counts = {}
	(0..arr[0].size-1).each do |i|
		counts[i] = {}
	end
	arr.each do |word|
		(0..word.size-1).each do |i|
			if counts[i].has_key?(word[i]) then
				counts[i][word[i]] += 1
			else
				counts[i][word[i]] = 1
			end
		end
	end
	result = []
	(0..arr.size-1).each do |i|
		curr_word = ""
		(0..arr[0].size-1).each do |j|
			temp_arr = []
			counts[j].keys.each do |char|
				(1..counts[i][char]) do
					temp_arr.push(char)
				end
			end
			curr_word += temp_arr[random * temp_arr.size]
		end
		result.add[curr_word]
	end
	result
end
