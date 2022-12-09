# You will need two classes:

# LinkedList class, which will represent the full list.
# Node class, containing a #value method and a link to the #next_node, set both as nil by default.
# Build the following methods in your linked list class:

# #append(value) adds a new node containing value to the end of the list
# #prepend(value) adds a new node containing value to the start of the list
# #size returns the total number of nodes in the list
# #head returns the first node in the list
# #tail returns the last node in the list
# #at(index) returns the node at the given index
# #pop removes the last element from the list
# #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
# #find(value) returns the index of the node containing value, or nil if not found.
# #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
# Extra Credit
# #insert_at(value, index) that inserts a new node with the provided value at the given index.
# #remove_at(index) that removes the node at the given index.
# Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    entry = Node.new(value)
    if @head.nil?
      @head = entry
      @tail = entry
    else
      @tail.next_node = entry
      @tail = entry
    end
  end

  def prepend(value)
    entry = Node.new(value)
    if @head.nil?
      @head = entry
      @tail = entry
    else
      entry.next_node = @head
      @head = entry
    end
  end

  def size
    return 0 if self.head.nil?

    count = 1
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def at(idx)
    current_node = @head
    until idx == 0
      current_node = current_node.next_node
      idx -= 1
    end
    current_node
  end

  # Algo pop method
  # select last element
  # select node poiting at last element
  # that node points now to nil
  # return the last element

  def pop
    aimed_node = @head
    tail = @tail
    until aimed_node.next_node == @tail
      aimed_node = aimed_node.next_node
    end
    aimed_node.next_node = nil
    tail
  end

  def contains(value)
    result = false
    current = @head
    until current.next_node.nil?
      current = current.next_node
      result = true if current.value == value
    end
    result
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @next_node = nil
    @value = value
  end
end


my_list = LinkedList.new
my_empty_list = LinkedList.new

my_list.append(35)
my_list.append(64)
my_list.append(387)
my_list.prepend(43)

puts "This is the head of the list #{my_list.head}"
puts "This is the tail of the list #{my_list.tail}"

puts my_list.at(3)
p my_list.pop
p my_list.size
p my_list.contains(35)
p my_list.contains(2)

