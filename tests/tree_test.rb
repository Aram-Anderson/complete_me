require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree.rb'
require 'pry'
SimpleCov.start

class TreeTest < Minitest::Test

  def test_it_has_a_root
    tree = Tree.new
    assert tree.root
  end

  def test_if_it_returns_count
    tree = Tree.new
    tree.insert("pizza")
    assert_equal 1, tree.count

    tree.insert("calzone")
    assert_equal 2, tree.count
  end

  def test_words_can_be_inserted
    tree = Tree.new
    assert true, tree.insert("pizza")
    assert true, tree.insert("pizzeria")
  end

  def test_when_word_is_selected_weight_is_incremented
    tree = Tree.new
    tree.insert("pizza")
    assert_equal 1, tree.select("piz", "pizza")

    tree.insert("calzone")
    tree.select("piz", "calzone")
    tree.select("piz", "calzone")
    tree.select("piz", "calzone")
    assert_equal 4, tree.select("piz", "calzone")
  end

  def test_it_can_suggest_words
    tree = Tree.new
    expected = ["pizzeria", "pizzicato", "pizzle", "pizza", "pize"]
    tree.insert("pizzeria")
    tree.insert("pizzicato")
    tree.insert("pizzle")
    tree.insert("pize")
    tree.insert("pizza")

    assert_equal ["pizzeria", "pizzicato", "pizzle", "pizza", "pize"], tree.suggest("piz")

    tree.populate('/usr/share/dict/words')

    assert_equal expected, tree.suggest("piz")
  end

  def test_it_can_populate_with_dictionary
    tree = Tree.new
    dictionary = File.read("/usr/share/dict/words")
    assert tree.populate(dictionary)
  end

  def test_dictionary_count_when_populated
    tree = Tree.new
    dictionary = File.read("/usr/share/dict/words")
    tree.populate(dictionary)
    # binding.pry
    assert_equal 235886, tree.count
  end

  def test_if_words_can_be_deleted
    tree = Tree.new
    tree.insert("pizza")
    tree.insert("pizzeria")

    assert_equal ["pizza", "pizzeria"], tree.suggest("piz")

    tree.delete("pizza")

    assert_equal ["pizzeria"], tree.suggest("piz")
  end

  def test_if_words_can_be_deleted_with_populated_tree
    tree = Tree.new
    dictionary = File.read("/usr/share/dict/words")
    tree.populate(dictionary)
    expected = ["pize", "pizza", "pizzeria", "pizzicato", "pizzle"]
    expected_2 = ["pize", "pizzeria", "pizzicato", "pizzle"]

    assert_equal expected, tree.suggest("piz")

    tree.delete("pizza")

    assert_equal expected_2, tree.suggest("piz")
  end
end
