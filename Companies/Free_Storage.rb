
require 'set'

# Given a string pattern see if a string follows it. [a b b a] [cat dog dog cat]
def string_pattern(pattern, str)
	pattern_matching = {}
	pattern_matching_two = {}
	patterns = pattern.split(' ')
	strings = str.split(' ')
	(0..patterns.size-1).each do |i|
		if pattern_matching.has_key?(patterns[i]) then
			return false if pattern_matching[patterns[i]] != strings[i]
		else
			pattern_matching[patterns[i]] = strings[i]
		end
		if pattern_matching_two.has_key?(strings[i]) then
			return false if pattern_matching_two[strings[i]] != patterns[i]
		else
			pattern_matching_two[strings[i]] = patterns[i]
		end
	end
	true
end

# Given two lists, find the intersecting values.
def arr_intersection(arr_one, arr_two)
	result = []
	one = Set.new arr_one
	arr_two.each do |val|
		result.push(val) if one.include?(val)
	end
	result
end