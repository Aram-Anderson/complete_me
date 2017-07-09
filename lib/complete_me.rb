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

  def select(sub_word, suggestion)
    @trie.select(sub_word, suggestion)
  end

  def suggest(word)
    @trie.suggest(word)
  end

  def populate(file)
    @trie.populate(file)
  end

end
