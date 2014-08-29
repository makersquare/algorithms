module Set1
  def self.swap_small(array) #darrell & Jimmy
    if array.count == 1
      return array
    end
    smallest_number = array[0]
    smallest_index = 0
    array.each_with_index do |value, index|
      if value < smallest_number
        smallest_number = value
        smallest_index = index
      end
    end
    if smallest_number == array[0]
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
    #Given an array of numbers, find out if there are two numbers in 
    #the array that add up to 0 (just return true or false). You can use 
    #the same number multiple times.
    if array.count == 0
      false
    elsif array.include?(0)
      true
    elsif array[0] == 0
      true
    else  
      flag = false
      array.each do |x|
        array.each do |y|
          if x + y == sum
            flag = true
          end
        end
      end
      flag
    end
  end

  def self.find_sum_3(array)
    if array.count == 0
      false
    elsif array.include?(0)
      true
    elsif array[0] == 0
      true
    else  
      flag = false
      array.each do |x|
        array.each do |y|
          array.each do |z|
            sum = x + y + z
            if sum == 0
              flag = true
            end
          end
        end
        flag
      end
    end
  end
end


