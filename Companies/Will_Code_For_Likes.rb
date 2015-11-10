require_relative '../HackerRank/trees'
require 'set'

# Given a sorted array convert it to a balanced binary search tree.ß
def sorted_bst(arr)
	return nil if arr.size == 0 
	if arr.size == 1 then
		root = BinaryNode.new(arr[0])
		return root
	end
	if arr.size == 2 then
		root = BinaryNode.new(arr[0])
		root_two = BinaryNode.new(arr[1])
		root.right = root_two
		return root
	end
	root = BinaryNode.new(arr[(arr.size-1)/2])
	root.left = sorted_bst(arr[0..((arr.size-1)/2)-1])
	root.right = sorted_bst(arr[((arr.size-1)/2)+1..arr.size-1])
	return root
end

# Given a set return the corresponding powerset.
def powerset(arr)
	return Set.new [[]] if arr.size == 0
	to_add = Set.new []
	done = powerset(arr[1..arr.size-1])
	done.each do |curr_set|
		new_set = curr_set.dup
		new_set.push(arr[0])
		to_add.add(new_set)
	end
	return to_add.union(done)
end

def robot_grid(grid,m,n,x,y)
	return 1 if x == m && y == n
	return 0 if x < m
	return 0 if y > n
	return 0 if grid[x][y] == 1
	path_1 = robot_grid(grid,m,n,x-1,y)
	path_2 = robot_grid(grid,m,n,x,y+1)
	path_1 + path_2
end