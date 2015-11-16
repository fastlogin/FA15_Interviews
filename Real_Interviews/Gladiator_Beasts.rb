
# Check if a string is a palindrome ignoring non-alphanumerics.
def palin_alpha(str)
	i = 0
	j = str.size-1
	while j > i do 
		while j > i && !(("a" <= str[j] && str[j] <= "z") || ("A" <= str[j] && str[j] <= "Z"))
			j -= 1
		end
		while i < j && !(("a" <= str[i] && str[i] <= "z") || ("A" <= str[i] && str[i] <= "Z"))
			i += 1
		end
		break if i > j
		return false if str[i] != str[j]
		j -= 1
		i += 1
	end
	true
end

# [1,2,3,4] -> [2*3*4,1*3*4,1*2*4,1*2*3]
def arr_prod(arr)
	left_acc = []
	right_acc = []
	acc_left = 1
	acc_right = 1
	(0..arr.size-1).each do |i|
		left_acc.push(acc_left *= arr[i])
		right_acc.push(acc_right *= arr[arr.size-1-i])
	end
	res = []
	(0..arr.size-1).each do |j|
		if j == 0 then
			res.push(right_acc[right_acc.size-2])
		elsif j == arr.size-1 then
			res.push(left_acc[left_acc.size-2])
		else
			res.push(left_acc[j-1] * right_acc[right_acc.size-2-j])
		end
	end
	res
end