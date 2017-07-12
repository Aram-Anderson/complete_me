require_relative 'node'

class Tree
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word, node = @root, index = -1)
    index += 1
    unless word[index]
      node.valid_word = true
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

  def count(node = @root, counter = [])
    # if node.children == {}
    #   return 0
    # end
    if node.valid_word == true
      counter << "You made me do this, Sal"
      recursing_count(node, counter)
    else
      recursing_count(node, counter)
    end
  end

  def recursing_count(node, counter)
    unless node.children.empty?
      node.children.each do | key, value |
      count(node.children[key], counter)
      end
    end
    if counter.empty?
      return 0
    else
      counter.count
    end
  end

  def select(sub_string, suggestion, node = @root)
    until suggestion.empty?
      check_letter = suggestion.slice!(0, 1)
      node = node.children[check_letter]
    end
    node.weight += 1
  end

  def suggest(word, node = @root)
     word.each_char do |letter|
      node.children.has_key?(letter)
      node = node.children[letter]
    end
    populate_suggest(word, node)
  end

  def populate_suggest(sub_string, node, suggestions = [])
    if node.valid_word == true
      suggestions << [sub_string, node.weight]
    end
    unless node.children.empty?
      node.children.keys.each do | letter |
        temp_suggest = sub_string + letter
        populate_suggest(temp_suggest, node.children[letter], suggestions)
      end
    end
    parse_suggest(suggestions)
  end

  def parse_suggest(suggestions)
    temp = suggestions.sort {|a, b| b[1] <=> a[1]}
    temp.map {|word| word[0]}
  end

  def populate(file)
    file = file.split("\n")
    file.each do |word|
      word.chomp!
      insert(word)
    end
  end

  def delete(word, node = @root, temp_letter = nil)
    temp_letter = word.slice!(0, 1)
    if node.valid_word && node.children.empty?
      node.valid_word = false
    elsif node.valid_word == false && node.children.empty?
      node.children = {}
    else
      delete(word, node.children[temp_letter], temp_letter)
    end
  end

end
