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

class Queue
  attr_accessor :next_node
  @@first_in_line = nil
  @@last_in_line = nil

  def initialize(value)
    @value = value
    @next_node = nil
    @@last_in_line.next_node = self unless @@last_in_line.nil?
    @@last_in_line = self
    @@first_in_line = self if @@first_in_line.nil?
  end


  def self.push(value)
    Queue.new(value)
  end

  def self.peek
    @@first_in_line
  end

  def self.shift
    first = @@first_in_line
    second = @@first_in_line.next_node
    @@first_in_line.next_node = nil
    if second.nil?
      @@first_in_line, @@last_in_line = nil, nil
    else
      @@first_in_line = second
    end
    first
  end
end

