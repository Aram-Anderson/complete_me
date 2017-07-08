require_relative 'node'

class Tree
  attr_reader :root

  def initialize
    @root = {"a" => Node.new}
  end

  def insert(word, node = @root)
    node.children.each do |k, v|
      if word.slice(0, 1) == k
        word.slice!(0, 1)
        word.insert(word, node = node.children)
      else
        word.chars.each do |letter|
          node.children[letter] = Node.new
        end
      end
    end
  end

end
