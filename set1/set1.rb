module Set1
  def self.swap_small(array) # O(n)
    if array.length == 1
      return array
    end
      smallest_num = array[0]
      array.each_index do |index|
        if array[index] < smallest_num
          smallest_num = array[index]
          end
        end

      small_index = array.index(smallest_num)
      array[0], array[small_index] = array[small_index], array[0]
      array
  end

  def self.find_sum_2(array, sum = 0) #O(n)
    return true if array.count(0) > 0
    
    array.each do |x|
      return true if array.count(-x) > 0
    end
    return false
  end

  def self.find_sum_3(array) #O(n^3)
    return true if array.count(0) > 0

    array.each do |x|
      array.each do |y|
        array.each do |z|
          return true if x + y + z == 0
        end
      end
    end
    return false
  end

end

