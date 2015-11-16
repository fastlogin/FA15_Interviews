
require 'set'

# Given a tree print the max value at each depth
def dfs(curr,depth,visited,depth_map)
	curr.children.each do |child|
		visited.add(child) if !visited.include?(child)
		if depth_map.has_key?(depth) then
			depth_map[depth] = child.value if child.value > depth_map[depth]
		else
			depth_map[depth] = child.value
		end
		dfs(child,depth+1,visited,depth_map)
	end
end

Struct.new("NodeDepth",:node, :depth)

def bfs(neighbors,visited,depth_map)
	while neighbors.size != 0 do
		temp = neighbors.pop
		visited.add(temp.node) if !visited.include?(temp.node)
		if depth_map.has_key?(temp.depth) then
			depth_map[temp.depth] = child.value if child.value > depth_map[temp.depth]
		else
			depth_map[temp.depth] = child.value
		end
		next_neighbors = temp.node.neighbors
		next_neighbors.each do |nneighbor|
			 to_add = Struct::NodePeth.new(nneighbor,temp.depth+1)
			 neighbors.unshift(to_add)
		end
	end
end

def print_max(root)
	depth_map = {}
	depth[0] = root.value
	visited = Set.new []
	dfs(root,1,visited,depth_map)
	# init_neighbors = []
	# root_neighbors = root.neighbors
	# root_neighbors.each do |rneighbor|
	# 	to_add = Struct::NodePeth.new(rneighbor,1)
	# 	init_neighbors.unshift(to_add)
	# end
	# bfs(init_neighbors,visited,depth_map)
	depth_map.keys.each do |depth|
		puts("Depth:" + depth.to_s + "," + " Max:" + depth_map[depth])
	end
end