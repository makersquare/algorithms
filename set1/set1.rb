module Set1

  #O(n) method
  def self.swap_small(array)

    if array.size == 1
      return array
    end

    min = 9999999999999
    index = 0

    array.each_with_index do |x, i|
      if x < min 
        min = x
        index = i
      end
    end

    smallest_val = array[index]
    first_val = array[0]

    array[0] = smallest_val
    array[index] = first_val
    return array

  end

  #O(n^2) method
  def self.find_sum_2(array, sum = 0)

    if array.empty?
      return false
    end

    array.each do |x|
      array.each do |y|
        if (x + y == sum || x == 0)
          return true
        end
      end
    end
    return false
  end

  def self.find_sum_3(array)
    
    if (array.size == 1 && array[0]==0)
      return true
    end

    if array.empty?
      return false
    end

    array.each do |x|
      array.each do |y|
        array.each do |z|
          if (x==0)
            return true
          end
          if x + y + z == 0
            #count +=1
            return true
          end
        end
      end
    end
    false
  end

end


