require 'pry'
class Node
  attr_reader
  attr_accessor :valid_word, :freq, :children

  def initialize
    @children = {}
    @valid_word = false
    @freq = 0
  end
end
