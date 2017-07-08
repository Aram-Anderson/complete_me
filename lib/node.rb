class Node

  attr_accessor :children

  def initialize
    @children = {}
    @count = 0
  end

  def children
    @children
  end

  def count
    @count
  end

end
