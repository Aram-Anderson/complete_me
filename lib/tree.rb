require_relative 'node'

class Tree
  attr_accessor :insert
  attr_reader :root

  def initialize
    @root = Node.new
    @count = 0
  end

  def count
    @count
  end

  def insert(word, node = @root, index = -1)
    node.freq += 1
    index += 1
    unless word[index]
      @root.freq = 0
      node.valid_word = word
      @count += 1
    else
      saved_letter = word[index]
      unless node.children[saved_letter].nil?
        insert(word, node.children[saved_letter], index)
      else
        node.children[saved_letter] = Node.new
        insert(word, node.children[saved_letter], index)
      end
    end
  end

  def suggest(word, node = @root, suggestions = [])
    return if node.children.nil?
    until word.empty?
      check_letter = word.slice!(0, 1)
      node = node.children[check_letter]
    end
      node.children.each do | k, v |
      if v.valid_word
        suggestions << v.valid_word
      end
      suggest(word, v, suggestions)
    end
    suggestions
  end

  def populate(file)
    words = File.readlines(file)
    words.each do |word|
      word.chomp!
      insert(word)
    end
    @count
  end


end
