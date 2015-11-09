require_relative 'lists'
require_relative 'trees'

class Queue
	attr_accessor :front, :back, :size
	def initialize(val)
		@front = DLNode.new(val)
		@back = @front
		@size = 1
	end

	def enqueue(val)
		@back.next = DLNode.new(val)
		@back.next.prev = @back
		@back = @back.next
		@size += 1
	end

	def dequeue
		returned = @front.value
		@front = @front.next
		@front.prev = nil
		@size -= 1
		returned
	end
end

class Stack
	attr_accessor :top, :size
	def initialize(val)
		@top = DLNode.new(val)
		@size = 1
	end

	def push(val)
		@top.next = DLNode.new(val)
		@top.next.prev = @top
		@top = @top.next
		@size += 1
	end

	def pop
		popped = @top.value
		@top = @top.prev
		@top.next = nil
		@size -= 1
		popped
	end
end

def arr_to_queue(arr)
	the_queue = Queue.new(arr[0])
	(1..arr.size-1).each do |i|
		the_queue.enqueue(arr[i])
	end
	the_queue
end

def arr_to_stack(arr)
	the_stack = Stack.new(arr[0])
	(1..arr.size-1).each do |i|
		the_stack.push(arr[i])
	end
	the_stack
end