require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node'
require './lib/linked_list'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_it_initializes_and_appends
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
    assert_instance_of LinkedList, jb.list
    assert_nil jb.list.head

    jb.append("deep doo ditt")

    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data

    jb.append("woo hoo shu")

    assert_equal 6, jb.count
  end

  def test_it_plays_sounds
    jb = JungleBeat.new

    jb.append("deep doo ditt woo hoo shu")

    assert_equal 6, jb.count
    assert_equal 6, jb.list.count
    assert_equal "", jb.play
  end
end
