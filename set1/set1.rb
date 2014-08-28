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

  # Big O notation: O(n^2)
  def self.find_sum_2(array, sum = 0)
    return false if array.length == 0
    return true if (array.length == 1) && (array[0] == 0)

    array.each_index do |index|
      return true if array[index] == 0
      array.each_index do |second_index|
        return true if array[index] + array[second_index] == 0
      end
    end
    false
  end

  # Big O notation: O(n^3)
  def self.find_sum_3(array)
    return false if array.length == 0
    return true if (array.length == 1) && (array[0] == 0)

    array.each_index do |index|
      return true if array[index] == 0
      array.each_index do |second_index|
        array.each_index do |third_index|
          return true if array[index] + array[second_index] + array[third_index] == 0
        end
      end
    end
    false
  end
end
