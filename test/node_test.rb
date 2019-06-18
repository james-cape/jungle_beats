require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_initializes
    node = Node.new("plop")

    assert_instance_of Node, node
    assert_equal "plop", node.data
    assert_nil node.next_node
  end
end
