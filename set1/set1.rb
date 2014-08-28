module Set1
  # Big O notation: O(n)
  def self.swap_small(array)
    return array if array.length == 1
    array.each_index do |index|
      if array[index] < array[0]
        temp = array[0]
        array[0] = array[index]
        array[index] = temp
      end
    end
  end

  def self.find_sum_2(array, sum = 0)
  end

  def self.find_sum_3(array)
  end
end
