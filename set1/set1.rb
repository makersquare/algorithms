module Set1

  # O(n)+O(1) - finding the smallest touches each element O(n), swapping adds O(1) time
  def self.swap_small(array)
    return nil if array.empty?
    min = array[0]
    store_index = 0
    array.each_index do |ind| 
      if array[ind] < min
        min = array[ind] 
        store_index = ind
      end
    end
    array[0], array[store_index] = array[store_index], array[0]
    array
  end

  #O(n2) - have to check each element against each other to find the sum
  def self.find_sum_2(array, sum = 0)
    return false if array.empty?
    array.each do |number_base|
      array.each do |adding_number|
        if ((number_base + adding_number) == sum)
          return true
        end
      end
    end
    return false
  end

  #O(n2^)
  def self.find_sum_3(array)
    return false if array.empty?
    array.each do |number_base|
      array.each do |adding_number1|
        array.each do |adding_number2|
          if ((number_base + adding_number1 + adding_number2) == 0)
            return true
          end
        end
      end
    end
    return false
  end
end
