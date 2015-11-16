
require 'set'

# Given an array of edges in the format (A,B) as strings, determine if
# the array represents a binary tree and print a nested parans representation
# of it.
def dfs(tree,visited,curr,cycle)
	res_str = "(" + curr
	if visited.include?(tree[curr][0]) then
		cycle.push(1)
		return res_str
	else
		res_str += dfs(tree[curr[0]])
		res_str += dfs(tree[curr[1]])
	end
	res_str + ")"
end

def binary_tree(edge_arr)
	tree_hash = {}
	edge_arr.each do |edge|
		if tree_hash.has_key?(edge[1]) then
			return "Duplicate edges" if tree_hash[edge[1]].include?(edge[3])
			tree_hash[edge[1]].push(edge[3])
			return "More than two children" if tree_hash[edge[1]].size > 2
		else
			tree_hash[edge[1]] = [edge[3]]
		end
	end
	cycle = []
	visited = Set.new []
	parents = tree_hash.keys
	min = parents[0]
	parents.each do |parent|
		min = parent if parent < min
	end
	result = dfs(tree_hash,visited,min,cycle)
	return "Has a cycle" if cycle.size > 0
	result
end