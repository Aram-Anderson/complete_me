require_relative 'node'

class Tree
  attr_accessor :insert
  attr_reader :root

  def initialize
    @root = Node.new
    @count = 0
  end

  # def insert(word)
  def insert(word, node = @root)
    if
      word == ""
      node.valid_word = true
      @count += 1
    else
      saved_letter = word.slice!(0, 1)
      unless node.children[saved_letter].nil?
        insert(word, node.children[saved_letter])
      else
        node.children[saved_letter] = Node.new
        node.freq += 1
        insert(word, node.children[saved_letter])
      end
    end
  end
  # end


end
