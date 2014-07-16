
module Set1
  # Linear complexity O(n)
  def self.swap_small(array)
    array[array.find_index(array.min)], array[0] = array[0], array[array.find_index(array.min)]
    array
  end
  # quadratic complexity O(n^2)
  def self.find_sum_2(array, sum = 0)
    array.uniq!
    array.each {|num| return true if array.any? {|x| x+num == 0 }}
    return false
  end
  # linear complexity
  def self.find_sum_3(array)
    new_array = array + array
    return true if new_array.include?(0)
    1000.times {return true if new_array.sample(3).inject(:+) == 0}
    return false
  end
end
