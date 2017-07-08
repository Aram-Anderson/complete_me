class Node

  attr_accessor :children

  def initialize
    @children = {}
    @count = 0
    @valid_word = false
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
