require 'pry'
class Node
  attr_reader
  attr_accessor :freq, :children, :valid_word

  def initialize
    @children = {}
    @valid_word = nil
    @freq = 0
  end

end
