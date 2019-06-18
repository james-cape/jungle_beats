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

  private

  def tail_node
    current_node = @head
    current_node = current_node.next_node while current_node.next_node
    current_node
  end
end
