class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    entry = Node.new(value)
    @head.nil? ? @head = entry : @tail.next_node = entry
    @tail = entry
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
    return 0 if @head.nil?

    count = 1
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def at(index)
    current_node = @head
    until index.zero?
      current_node = current_node.next_node
      index -= 1
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
    current_node = @head
    until current_node.next_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    current_node.value == value
  end

  def find(value)
    current = @head
    idx = 0
    until current.next_node.nil?
      return idx if current.value == value

      current = current.next_node
      idx += 1
    end
    current.value == value ? idx : nil
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

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


my_list = LinkedList.new

my_list.append(35)
my_list.append(64)
my_list.append(387)
my_list.prepend(588)
my_list.prepend(43)

puts my_list.find(387)
puts my_list.contains(387)
