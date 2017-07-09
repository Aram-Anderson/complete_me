require_relative 'tree'

class CompleteMe

  def initialize
    @trie = Tree.new
  end

  def trie
    @trie
  end

  def insert(word)
    @trie.insert(word)
  end

  def suggest(word)
  end

  def populate(file)
    @trie.populate(file)
  end

end
