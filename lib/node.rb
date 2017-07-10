require 'pry'
class Node
  attr_accessor :children, :valid_word, :freq

  def initialize
    @children = {}
    @valid_word = false
    @freq = 0
  end

end
