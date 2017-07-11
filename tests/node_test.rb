require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require '../lib/node'

class NodeTest < Minitest::Test

  def test_node_has_no_children_to_begin
    node = Node.new
    assert_equal true, node.children.empty?
  end

  def test_node_initializes_with_valid_word_as_false
    node = Node.new
    assert_equal false, node.valid_word
  end

  def test_node_initializes_with_freq_at_zero
    node = Node.new
    assert_equal 0, node.freq
  end

  def test_node_initializes_with_weight_at_zero
    node = Node.new
    assert_equal 0, node.weight
  end

end
