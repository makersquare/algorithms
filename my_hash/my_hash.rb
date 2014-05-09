class MyHash
  def initialize
    @pairs = Array.new(4) {[]}
  end

  def []=(key, value)
    index = find_index(key)
    @pairs[index].each do |pair|
      pair[-1] = value if pair.first == key
    end
    @pairs[index] << [key, value]
  end

  def [](key)
    index = find_index(key)
    @pairs[index].each do |pair|
      return pair[-1] if pair.first == key
    end
      return nil
  end

  def find_index(key)
    key.hash % 4
  end

end
