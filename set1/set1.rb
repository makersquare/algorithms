module Set1
  def self.swap_small(array)
    if array.length == 1
      return array
    else
      min = array.first
      array.each do |n|
        if n < min 
          min = n
        end
    end
    array[array.index(min)] = array.first
    array[0] = min
    array
  end
end

  def self.find_sum_2(array, sum = 0)
  end

  def self.find_sum_3(array)
  end
end
