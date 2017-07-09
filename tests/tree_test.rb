require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree.rb'
require 'pry'


class TreeTest < Minitest::Test

  def test_it_has_a_root
    tree = Tree.new
    assert tree.root
  end

  def test_if_it_returns_count
    tree = Tree.new
    assert_equal 1, tree.insert("pizza")
    tree.insert("pasta")
    tree.insert("calzone")
    assert_equal 4, tree.insert("cake")
  end

end
