
class Node
  attr_reader :data, :left_child, :right_child

  def initialize(data, left, right)
    @data = data
    @left_child = left
    @right_child = right
  end
end

class Traverse

  def self.root_only(tree)
    yield tree.data
  end

  def self.with_preorder(node)
    # TODO
  end

  def self.with_inorder(node)
    # TODO
  end

  def self.with_postorder(node)
    # TODO
  end

  def self.with_levelorder(node)
    # TODO: EXTENSION
    # HINT: Use an iterative solution
  end
end
