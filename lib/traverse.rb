
class Node
  attr_reader :data, :left_child, :right_child

  def initialize(data, left, right)
    @data = data
    @left_child = left
    @right_child = right
  end
end

class Traverse

  def self.capture(data)
    puts "Captured: #{data}"
  end

  def self.root_only(tree)
    capture(tree.data)
  end

  def self.with_preorder(node)
    capture(node.data)
    with_preorder(node.left_child) if node.left_child
    with_preorder(node.right_child)  if node.right_child
  end

  def self.with_inorder(node)
    with_inorder(node.left_child)  if node.left_child
    capture(node.data)
    with_inorder(node.right_child) if node.right_child
  end

  def self.with_postorder(node)
    with_postorder(node.left_child)  if node.left_child
    with_postorder(node.right_child) if node.right_child
    capture(node.data)
  end

  def self.with_levelorder(node)
    # TODO: EXTENSION
    # HINT: Use an iterative solution
  end
end
