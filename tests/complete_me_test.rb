require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/complete_me.rb'
require 'pry'


class CompleteMeTest < Minitest::Test
  def test_it_has_a_root
    completion = CompleteMe.new
    assert completion.trie.root
  end

  def test_if_it_returns_count
    completion = CompleteMe.new
    completion.insert("pizza")
    assert_equal 1, completion.count

    completion.insert("calzone")
    assert_equal 2, completion.count
  end

  def test_words_can_be_inserted
    completion = CompleteMe.new
    assert true, completion.insert("pizza")
    assert true, completion.insert("pizzeria")
  end

  def test_when_word_is_selected_weight_is_incremented
    completion = CompleteMe.new
    completion.insert("pizza")
    assert_equal 1, completion.select("piz", "pizza")

    completion.insert("calzone")
    completion.select("piz", "calzone")
    completion.select("piz", "calzone")
    completion.select("piz", "calzone")
    assert_equal 4, completion.select("piz", "calzone")
  end

  def test_it_can_suggest_words
    completion = CompleteMe.new
    expected = ["pizzeria", "pizzicato", "pizzle", "pizza", "pize"]
    completion.insert("pizzeria")
    completion.insert("pizzicato")
    completion.insert("pizzle")
    completion.insert("pize")
    completion.insert("pizza")

    assert_equal ["pizzeria", "pizzicato", "pizzle", "pizza", "pize"], completion.suggest("piz")

    completion.populate('/usr/share/dict/words')

    assert_equal expected, completion.suggest("piz")
  end

  def test_it_can_populate_with_dictionary
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    assert completion.populate(dictionary)
  end

  def test_dictionary_count_when_populated
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    completion.populate(dictionary)
    # binding.pry
    assert_equal 235886, completion.count
  end

  def test_if_words_can_be_deleted
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("pizzeria")

    assert_equal ["pizza", "pizzeria"], completion.suggest("piz")

    completion.delete("pizza")

    assert_equal ["pizzeria"], completion.suggest("piz")
  end

  def test_if_words_can_be_deleted_with_populated_completion
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    completion.populate(dictionary)
    expected = ["pize", "pizza", "pizzeria", "pizzicato", "pizzle"]
    expected_2 = ["pize", "pizzeria", "pizzicato", "pizzle"]

    assert_equal expected, completion.suggest("piz")

    completion.delete("pizza")

    assert_equal expected_2, completion.suggest("piz")
  end
end
