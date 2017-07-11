require 'minitest/autorun'
require 'minitest/pride'
require './lib/complete_me.rb'
require 'pry'
require 'simplecov'
SimpleCov.start


class CompleteMeTest < Minitest::Test
  def test_it_has_a_root
    complete = CompleteMe.new

    assert complete.trie.root
  end

  def test_if_it_returns_count
    complete = CompleteMe.new

    assert_equal 1, complete.insert("pizza")

    complete.insert("pasta")
    complete.insert("calzone")

    assert_equal 4, complete.insert("cake")
  end

  def test_it_can_suggest_words
    complete = Tree.new
    expected = ["pizza", "pizzeria", "pizzicato", "pizzle", "pize"]
    complete.insert("pizza")

    assert_equal ["pizza"], complete.suggest("piz")

    complete.populate('/usr/share/dict/words')


    assert_equal expected, complete.suggest("piz")
  end

  def test_it_can_populate_with_dictionary
    complete = CompleteMe.new

    assert_equal 235886, complete.populate('/usr/share/dict/words')
  end

end
