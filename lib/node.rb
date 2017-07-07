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

  def insert(word)
    word.chars.each do |letter|
      self.children[letter] = Node.new
    end
  end
end
