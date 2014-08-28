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
    if array.include?(sum)
      return true
    elsif array.empty?
      return false
    else
      array.each_index do |x|
        array.each_index do |y|
          if array[x] + array[y] == 0
            return true
          end
        end
      end
    end
    false
  end

  def self.find_sum_3(array)
   if array.include?(0)
      return true
    elsif array.empty?
      return false
    else
      array.each_index do |x|
        array.each_index do |y|
          array.each_index do |z|
          if array[x] + array[y] + array[z] == 0
            return true
          end
          end
        end
      end
    end
    false
  end

end





