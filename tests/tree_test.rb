require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree.rb'
require 'pry'
require 'simplecov'
SimpleCov.start


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

  def test_it_can_suggest_words
    tree = Tree.new
    expected = ["pizza", "pizzeria", "pizzicato", "pizzle", "pize"]
    tree.insert("pizza")

    assert_equal ["pizza"], tree.suggest("piz")

    tree.populate('/usr/share/dict/words')

    assert_equal expected, tree.suggest("piz")
  end

  def test_it_can_populate_with_dictionary
    tree = Tree.new

    assert_equal 235886, tree.populate('/usr/share/dict/words')
  end

end
