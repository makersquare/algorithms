module Set1
  def self.swap_small(array)
  	if array.size > 1
  		min = 0
  		array.each_with_index do |x, y|
  			if x < array[min] 
  				min = y
  			end
      end
      if array[0] == array[min]
        return array
      else
        array[0], array[min] = array[min], array[0]
        return array
      end
    elsif array.size == 1
      return array      
    end
  end

  def self.find_sum_2(array, sum = 0)
    if array.size == 0
      return false
    elsif ((array.size == 1 && array[0] == 0) || (array.include? 0))
      return true
    end
    array.each do |x|
      if array.include? -x
        return true
      end
    end
    array.each do|x|
      array.each do |y|
        if x + y == 0
          return true
        else
          return false
        end
      end
    end
  end

  def self.find_sum_3(array)
    if array.size == 0
      return false
    elsif (array.size == 1 && array.first == 0)
      return true
    elsif array.include? 0
      return true      
    end
    array.each do |x|
      array.each do |y|
        array.each do |z|
          if x+y+z == 0
            return true
          end
        end
      end
    end
    return false
  end
end
