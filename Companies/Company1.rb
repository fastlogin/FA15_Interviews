require_relative '../HackerRank/trees'

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