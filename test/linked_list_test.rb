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

  def test_it_finds_pops_and_includes
    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string

    assert_equal "shi", list.find(2,1)
    assert_equal "woo shi shu", list.find(1,3)

    assert_equal true, list.includes?("deep")
    assert_equal true, list.includes?("blop")
    assert_equal false, list.includes?("dep")

    assert_equal "blop", list.pop
    assert_equal "shu", list.pop

    assert_equal "deep woo shi", list.to_string
  end

  def test_it_pops_more_nodes_than_exist
    list = LinkedList.new

    list.append("deep")
    list.append("woo")

    assert_equal "deep woo", list.to_string
    assert_equal "woo", list.pop
    assert_equal "deep", list.pop
    refute list.pop
  end

  def test_if_empty_list_includes_anything
    list = LinkedList.new

    refute list.head

    list.append("deep")
    list.append("woo")

    list.pop
    list.pop

    refute list.head

    list.append("deep")

    assert_equal "deep", list.head.data
  end

  def test_inserting_elements_after_list_ends_adds_them_to_end
    list = LinkedList.new

    list.append("deep")
    list.append("woo")

    list.insert(5, "blop")

    assert_equal "deep woo blop", list.to_string
  end
end
