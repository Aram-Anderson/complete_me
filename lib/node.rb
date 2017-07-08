class Node

  attr_writer :children, :insert

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
