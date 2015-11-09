require_relative '../trees'

# print preorder traversal of a binary tree
def preorder(root)
	print(root.value)
	preorder(root.left) if root.left != nil
	preorder(root.right) if root.right != nil 
end

# print postorder traversal of a binary tree
def postorder(root)
	postorder(root.left) if root.left != nil
	postorder(root.right) if root.right != nil 
	print(root.value)
end

# print inorder traversal of a binary tree
def inorder(root)
	inorder(root.left) if root.left != nil
	print(root.value)
	inorder(root.right) if root.right != nil 
end

# get the height of a binary tree
def height(root)
	if root.left != nil && root.right != nil then
		left_r = 1 + height(root.left)
		right_r = 1 + height(root.right)
		if left_r > right_r then
			left_r
		else
			right_r
		end
	else
		1 + height(root.left) if root.left != nil
		1 + height(root.right) if root.right != nil
		1 if root.right == nil && root.left == nil
	end
end

