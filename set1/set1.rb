module Set1
  def self.swap_small(array)
    min_value = array[0]
    min_value_index = 0

    array.each_index do |i|
      if array[i] < min_value
        min_value = array[i]
        min_value_index = i
      end
      array[min_value_index] = array[0]
      array[0] = min_value
    end
  end

  def self.find_sum_2(array, sum = 0)
    if array.length == 0
      return false
    end

    array.each_index do |i|
      array.each_index do |x|
        if array[i] + array[x] == 0
          return true
        elsif array[i] == 0 || array[x] == 0
          return true
        # else 
          # return false
        end
      end
    end
    false
  end

  def self.find_sum_3(array)
    if array.length == 0
      return false
    end

    array.each_index do |i|
      array.each_index do |x|
        array.each_index do |r|
          if array[i] + array[x] + array[r] == 0
            return true
          elsif array[i] == 0 || array[x] == 0 || array[r] == 0
            return true
          # else
          #   return false 
          end
        end
      end
    end
    false
  end
end
