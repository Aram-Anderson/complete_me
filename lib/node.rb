require 'pry'
class Node
  attr_accessor :children, :valid_word, :freq, :weight

  def initialize
    @children = {}
    @valid_word = false
    @freq = 0
    @weight = 0
  end

end
