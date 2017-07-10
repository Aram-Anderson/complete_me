require_relative 'node'

class Tree
  attr_accessor :insert
  attr_reader :root, :count

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
      if node.valid_word.nil?
        @count += 1
      end
      node.valid_word = word
      @count
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
    sorted_suggestions = suggestions.sort_by

  end

  def populate(file)
    words = File.readlines(file)
    words.each do |word|
      word.chomp!
      insert(word)
    end
    @count
  end

  def delete(word, node = @root, index = 0, temp_letter = word[index])
    if node.children[temp_letter].freq == 1 && node.children.count == 1
      node.children = {}
    else
      binding.pry

      index += 1
      temp_letter = word[index]
      delete(word, node.children[temp_letter], index, temp_letter)

    end
  end
    #   temp_letter = word[0]
    #   index = 1
    #   node = @root
    # until (node.children.count == 1 && node.children[temp_letter].freq == 1) || temp_letter == word[-1]
    #   temp_letter = word[index]
    #   index += 1
    #   return if node.children.nil?
    #   node = node.children[temp_letter]
    #   binding.pry
    # end
    # return if index == word.length - 1 || node.children.nil?
    # node.children = {}
  # end

end
