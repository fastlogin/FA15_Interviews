require_relative '../lists'

def array_llist(arr)
	head = LNode.new(arr[0])
	prev_curr = head
	(1..arr.size-1).each do |i|
		curr = LNode.new(arr[i])
		prev_curr.next = curr
		prev_curr = curr
	end
	return head
end

def print_llist(head)
	curr = head
	while curr != nil do
		print(curr.value.to_s+" ")
		curr = curr.next
	end
end

def reverse(head)
	temp = head.next
	head.next = nil
	prev = head
	curr = temp
	while curr != nil do
		temp = curr.next
		curr.next = prev
		prev = curr
		curr = temp
	end
	return prev
end