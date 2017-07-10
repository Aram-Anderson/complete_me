require 'pry'
class Node
  attr_accessor :children, :valid_word, :freq

  def initialize
    @children = {}
    @valid_word = nil
    @freq = 0
  end

end
