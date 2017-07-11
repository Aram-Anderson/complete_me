require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/complete_me.rb'
require 'pry'


class CompleteMeTest < Minitest::Test
  def test_it_has_a_root
    complete = CompleteMe.new
    assert complete.trie.root
  end

  def test_if_it_returns_count
    complete = CompleteMe.new
    complete.insert("pizza")
    assert_equal 1, complete.count

    complete.insert("calzone")
    assert_equal 2, complete.count
  end

  def test_words_can_be_inserted
    complete = CompleteMe.new
    assert true, complete.insert("pizza")
    assert true, complete.insert("pizzeria")
  end

  def test_when_word_is_selected_weight_is_incremented
    complete = CompleteMe.new
    complete.insert("pizza")
    assert_equal 1, complete.select("piz", "pizza")

    complete.insert("calzone")
    complete.select("piz", "calzone")
    complete.select("piz", "calzone")
    complete.select("piz", "calzone")
    assert_equal 4, complete.select("piz", "calzone")
  end

  def test_it_can_suggest_words
    complete = CompleteMe.new
    expected = ["pizzeria", "pizzicato", "pizzle", "pizza", "pize"]
    complete.insert("pizzeria")
    complete.insert("pizzicato")
    complete.insert("pizzle")
    complete.insert("pize")
    complete.insert("pizza")

    assert_equal ["pizzeria", "pizzicato", "pizzle", "pizza", "pize"], complete.suggest("piz")

    complete.populate('/usr/share/dict/words')

    assert_equal expected, complete.suggest("piz")
  end

  def test_it_can_populate_with_dictionary
    complete = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    assert complete.populate(dictionary)
  end

  def test_dictionary_count_when_populated
    complete = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    complete.populate(dictionary)
    # binding.pry
    assert_equal 235886, complete.count
  end

  def test_if_words_can_be_deleted
    complete = CompleteMe.new
    complete.insert("pizza")
    complete.insert("pizzeria")

    assert_equal ["pizza", "pizzeria"], complete.suggest("piz")

    complete.delete("pizza")

    assert_equal ["pizzeria"], complete.suggest("piz")
  end

  def test_if_words_can_be_deleted_with_populated_complete
    complete = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    complete.populate(dictionary)
    expected = ["pize", "pizza", "pizzeria", "pizzicato", "pizzle"]
    expected_2 = ["pize", "pizzeria", "pizzicato", "pizzle"]

    assert_equal expected, complete.suggest("piz")

    complete.delete("pizza")

    assert_equal expected_2, complete.suggest("piz")
  end
end
