require_relative 'node'

class Tree
  attr_reader :root

  def initialize
    @root = Node.new
  end

end
