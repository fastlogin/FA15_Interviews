
# Node for singly linked list.
class LNode
	attr_accessor :value, :next
	def initialize(val)
		@value = val
		@next = nil
	end
end

# Node for doubly linked list.
class DLNode
	attr_accessor :value, :next, :prev
	def initialize(val)
		@value = val
		@next = nil
		@prev = nil
	end
end
