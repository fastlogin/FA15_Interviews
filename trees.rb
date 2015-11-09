
# Node for N-nary trees.
class Node
	attr_accessor :value, :children
	def initialize(val)
		@value = val
		@children = []
	end
end

# Node for Binary trees.
class BinaryNode
	attr_accessor :value, :left, :right
	def initialize(val)
		@value = val
		@left = nil
		@right = nil
	end
end