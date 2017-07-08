require_relative 'node'

class Tree
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word, node = @root)
    node.children.each do |k, v|
      word.chars.each do |letter|
        if word.slice(0, 1) == k
          word.slice!(0, 1)
          insert(word, node = node[k].children)
        else
          node.children[letter] = Node.new
        end
      end
    end
  end

end
