require 'set'

# Return abs difference of two diags of square matrix.
def diag_abs(mat)
	diag1 = 0
	diag2 = 0
	(0..mat.size-1).each do |i|
    	diag1 += mat[i][i].to_i
    	diag2 +=  mat[i][mat.size-i-1].to_i
	end
	(diag1-diag2).abs
end

# Return ratio of negative and positive numbers and zeroes in an array.
def neg_pos_zero(arr)
	zeros = 0;
	negs = 0;
	pos = 0;
	arr.each do |val|
    	if val > 0 then
        	pos += 1
    	elsif val < 0 then
        	negs += 1
    	else
        	zeros += 1
    	end
	end
	puts(Float(pos)/len)
	puts(Float(negs)/len)
	puts(Float(zeros)/len)
end

# Print staircase of height height
def staircase(height)
	(1..height).each do |i|
    	(1..height-i).each do |j|
      		print(" ")  
    	end
    	(1..i).each do |k|
        	if k == i then
            	puts("#")
        	else
            	print("#")
        	end
    	end
	end
end

# You are given time in AM/PM format. Convert this into a 24-hour format. hh:mm:ssAM or hh:mm:ssPM -> hh:mm:ss
def time_convert(twelve)
	if twelve[8..9] == "PM" then
    	if twelve[0..1] == "12" then 
        	twentyfour = twelve[0..7]
    	else
        	twentyfour = (twelve[0..1].to_i + 12).to_s + twelve[2..7]
    	end
	else
    	if twelve[0..1] == "12" then 
        	twentyfour = "00" + twelve[2..7]
    	else
        	twentyfour = twelve[0..7]
    	end
	end
	twentyfour
end

# Given two lists of numbers find all the missing numbers in a from b
def missing_nums(a,b)
    ahash = {}
    bhash = {}
    while i < a.size do
        if ahash.has_key?(a[i]) then
            ahash[a[i]] += 1
        else
            ahash[a[i]] = 1
        end
        if bhash.has_key?(b[i]) then
            bhash[b[i]] += 1
        else
            bhash[b[i]] = 1
        end
        i += 1
    end
    while i < b.size do
        if bhash.has_key?(b[i]) then
            bhash[b[i]] += 1
        else
            bhash[b[i]] = 1
        end
        i += 1
    end
    result = []
    bhash.keys.each do |key|
        result.push(key) if (!ahash.has_key?(key) || bhash[key] > ahash[key])
    end
    result.sort
end

# Check if two strings share a substring
def share_sub(a,b)
    a_dict = Set.new a.chars
    b.chars.each do |c|
        if a_dict.include?(c) then
            return true
        end
    end
    false
end

# Return the least number of necessary character changes needed to make one half a string an anagram of the other half.
def least_char_anagram(str)
    if str.size % 2 != 0 then
        puts("-1")
    else
    first_hash = {}
    second_hash = {}
    (0..((str.size / 2) - 1)).each do |i|
        if first_hash.has_key?(str[i]) then
            first_hash[str[i]] += 1
        else
            first_hash[str[i]] = 1
        end
        if second_hash.has_key?(str[(i + (str.length / 2))]) then 
            second_hash[str[(i + (str.length / 2))]] += 1
        else
            second_hash[str[(i + (str.length / 2))]] = 1
        end
    end
    ans = 0
    first_hash.keys.each do |chr|
        if second_hash.has_key?(chr) then
            ans += (second_hash[chr] - first_hash[chr]).abs 
        else
            ans += first_hash[chr]
        end
    end
    second_hash.keys.each do |chr|
        ans += second_hash[chr] unless first_hash.has_key?(chr)
    end
    ans/2
end

# find index of character to remove to make string a palindrome, assume there is always a solution. return -1
# if string is already a palindrome.
def palindrome_index(str) 
    left_init = 0
    right_init = str.size - 1
    is_pal = true
    while (left_init <= right_init) do
        is_pal = false if str[left_init] != str[right_init]
        left_init += 1
        right_init -= 1
    end
    return -1 if is_pal
    (0..str.size-1).each do |i|
        left = 0
        right = str.size - 1
        while (left < right) do
            left += 1 if left == i
            right -= 1 if right == i
            break if str[left] != str[right]
            left += 1
            right -= 1
        end
        if left >= right then
            i
        end
     end
end

# Given two rectangular matrices see if the smaller one, p_mat, exists in the larger one
# contiguously.
def grid_pattern(g_mat, p_mat)
    rows_g = g_mat.size
    cols_g = g_mat[0].size
    rows_p = p_mat.size
    cols_p = p_mat[0].size
    i = 0
    j = rows_p - 1
    while j < rows_g do
        k = 0
        l = cols_p - 1
        while l < cols_g do
            ans = true
            (i..j).each do |m|
                ans = ans && ((g_mat[m])[k..l] == p_mat[m-i])
            end
            if ans then
                return true
            end
            k += 1
            l += 1
        end
        break if found 
        i += 1
        j += 1
    end
    return false
end
        
