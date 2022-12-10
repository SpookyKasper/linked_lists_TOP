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
        current_node.next_node = current_node.next_node.next_node
        return "#{current_node.next_node.value} was removed at index #{idx}"
      end
      current_node = current_node.next_node
      index += 1
    end
  end
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

