module Set1
  def self.swap_small(array) #darrell & Jimmy
    if array.count == 1
      return array
    end
    flag = false
    smallest_number = array[0]
    smallest_index = 0
    array.each_with_index do |value, index|
      if value < smallest_number
        smallest_number = value
        smallest_index = index
        flag = true
      end
    end
    if !flag
      return array
    end
    array.delete_at(smallest_index)
    temp = array[0]
    array.delete(array[0])
    array.unshift(smallest_number)
    array.insert(smallest_index, temp)
    array
  end

  def self.find_sum_2(array, sum = 0)

  end

  def self.find_sum_3(array)
  end
end


