module Set1
  def self.swap_small(array)
  temp = 0
  array.each_index do |index|
    if array[index] < array[temp]
      temp = index
    end
  end
  array[0],array[temp] = array[temp],array[0] 
  array
  end


  def self.find_sum_2(array, sum = 0)
    if array.empty?
      return false
    end
    array.each do |x|
      array.each do |y|
        if y == 0
          return true
        elsif x + y == 0
          return true
        end
      end
    end
    false
  end

  def self.find_sum_3(array)
    if array.empty?
      return false
    end
    array.each do |x|
      array.each do |y|
        array.each do |z|
        if y == 0 || z == 0
          return true
        elsif x + y + z == 0
          return true
        end
        end
      end
    end
    false
  end
end

array = [5,7,2,9]
Set1.swap_small(array)

