require_relative 'node'

class Tree
  attr_reader :root

  def initialize
    @root = {"a" => Node.new}
  end

end
