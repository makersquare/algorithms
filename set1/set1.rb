module Set1
  def self.swap_small(array)
    first_number = array.first
    smallest_number = nil
    position = nil
    (0...array.length).each do |num|
      if smallest_number == nil || smallest_number > array[num]
        smallest_number = array[num]
        position = num
      end
    end
    if smallest_number != first_number
      array.delete(smallest_number)
      array.delete(first_number)
      array.unshift(smallest_number)
      array.insert(position, first_number)
    else
      array.delete(smallest_number)
      array.unshift(smallest_number)
    end
  end

  def self.find_sum_2(array, sum = 0)
  end

  def self.find_sum_3(array)
  end
end
