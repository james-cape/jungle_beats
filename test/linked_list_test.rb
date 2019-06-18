require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_it_initializes_and_appends
    list = LinkedList.new

    assert_instance_of LinkedList, list
    assert_nil list.head

    list.append("doop")

    assert_equal "doop", list.head.data
    assert_nil list.head.next_node
    assert_equal 1, list.count
    assert_equal "doop", list.to_string
  end
end
