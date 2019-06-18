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

  def test_it_adds_multiple_list_items
    list = LinkedList.new

    list.append("doop")
    list.append("deep")

    assert_equal "doop", list.head.data
    assert_equal "deep", list.head.next_node.data
    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string
  end
  
  def test_it_prepends_and_inserts
    list = LinkedList.new

    list.append("plop")
    assert_equal "plop", list.to_string

    list.append("suu")

    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count

    list.insert(1, "woo")
    assert_equal "dop woo plop suu", list.to_string
  end
end
