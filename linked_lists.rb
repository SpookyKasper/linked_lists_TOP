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
      result = true if current.value == value
      current = current.next_node
    end
    result
  end

  def find(value)
    current = @head
    result = nil
    idx = 0
    until current.next_node.nil?
      if current.value == value
        result = idx
      end
      current = current.next_node
      idx += 1
    end
    result
  end

  def to_s
    current_node = @head
    string = ""
    until current_node.next_node.nil?
      string += "(#{current_node.value.to_s}) -> "
      current_node = current_node.next_node
    end
    string += "(#{current_node.value.to_s}) -> nil"
    string
  end

  def insert_at(value, idx)
    current_node = @head
    index = 0
    prepend(value) and return if idx == 0
    until current_node.next_node.nil?
      if index == idx - 1
        my_node = Node.new(value, current_node.next_node)
        current_node.next_node = my_node
        return "#{value} was inserted at index #{idx}"
      end
      index += 1
      current_node = current_node.next_node
    end
    append(value)
  end

  def remove_at(idx)
    current_node = @head
    index = 0
    @head = current_node.next_node and return "#{current_node.value} was removed at index #{idx}" if idx == 0
    until current_node.next_node.nil?
      if index == idx - 1
        value = current_node.next_node.value
        p value
        current_node.next_node = current_node.next_node.next_node
        return "#{value} was removed at index #{idx}"
      end
      current_node = current_node.next_node
      index += 1
    end
  end
  # Pseudo code for remove_at
  # Given a index remove the value at that index:
  # go through the list until just before the wanted index
  # the current_node next_node becomes the next_nodex.next_node
  #

end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @next_node = next_node
    @value = value
  end
end


my_list = LinkedList.new
my_empty_list = LinkedList.new

my_list.append(35)
my_list.append(64)
my_list.append(387)
my_list.prepend(588)
my_list.prepend(43)




p my_list.to_s
p my_list.insert_at(34, 1)
p my_list.to_s
p my_list.remove_at(2)
p my_list.to_s
p my_list.remove_at(0)
p my_list.to_s

