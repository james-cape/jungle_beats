class LinkedList

  attr_reader :head
  def intialize
    @head = nil
  end

  def append(data)
    @head ? (tail_node.next_node = Node.new(data)) : @head = Node.new(data)
  end

  def count
    @head ? (node_count = 1) : (node_count = 0)
    current_node = @head
    while current_node.next_node
      node_count += 1
      current_node = current_node.next_node
    end
    node_count
  end

  def to_string
    current_node = @head
    string = ""
    while current_node
      string += "#{current_node.data} "
      current_node = current_node.next_node
    end
    string.chomp(" ")
  end

  def prepend(data)
    front_node = Node.new(data)
    front_node.next_node = @head
    @head = front_node
  end

  def insert(target_after, data)
    current_node = index_node(target_after - 1)
    old_next_node = current_node.next_node
    current_node.next_node = Node.new(data)
    current_node.next_node.next_node = old_next_node
  end

  def find(index, quantity)
    produce_string(index_node(index), quantity)
  end

  def includes?(data)
    has_data = false
    current_node = @head
    while current_node && has_data == false
      has_data = true if current_node.data == data
      current_node = current_node.next_node
    end
    has_data
  end

  def pop
    !@head ? pop_empty : !@head.next_node ? pop_single : pop_linked
  end

  private

  def pop_linked
    node = @head
    node = node.next_node while node.next_node != tail_node
    popped_data = node.next_node.data
    node.next_node = nil
    popped_data
  end

  def pop_single
    popped_data = @head.data
    @head = nil
    popped_data
  end

  def pop_empty
    nil
  end

  def tail_node
    current_node = @head
    current_node = current_node.next_node while current_node.next_node
    current_node
  end

  def index_node(index)
    index_node = @head
    counter = 0
    while counter != index
      counter += 1
      index_node = index_node.next_node
    end
    index_node
  end

  def produce_string(index_node, quantity)
    counter = 1
    string = index_node.data
    while counter != quantity
      counter += 1
      string += " #{index_node.next_node.data}"
      index_node = index_node.next_node
    end
    string
  end
end
