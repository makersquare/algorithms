class Stack
  @stack = []

  def self.push(x)
    @stack.push(x)
  end

  def self.pop
    @stack.pop
  end

  def self.peek
    @stack[-1]
  end
end