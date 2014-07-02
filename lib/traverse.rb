
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

  def self.with_preorder(node, &block)
    # TODO
  end

  def self.with_inorder(node, &block)
    # TODO
  end

  def self.with_postorder(node, &block)
    # TODO
  end

  def self.with_levelorder(node)
    # TODO: EXTENSION
    # HINT: Use an iterative solution
  end
end
