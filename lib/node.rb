class Node

  attr_writer :children, :insert

  def initialize
    @children = {}
  end

  def children
    @children
  end

  def insert(word)
    word.chars.each do |letter|
      self.children[letter] = Node.new
    end
  end
end
