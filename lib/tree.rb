require_relative 'node'

class Tree
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word, node = @root)
    children.each do |k, v|
      if word.slice(0, 1) == k
        word.slice!(0, 1)
        insert(word, node = node.children)
      else
        word.chars.each do |letter|
          children[letter] = Node.new
        end
      end
    end
  end

end
