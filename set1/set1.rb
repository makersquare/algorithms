module Set1
  def self.swap_small(array)
    if array.length == 1 
      return array
    else
      min_num = array.first
      array.each do |x|
        if x <= min_num
          min_num = x
        end
      end
      array[array.index(min_num)] = array.first
      array[0] = min_num
      array
    end
  end

  def self.find_sum_2(array, sum = 0)
    if array.length == 0 
      return false
    elsif array.include?(0)
      return true
    elsif array.each { |x| array.include?(x) && array.include?(-x) }
      return true
    else # Can not get this one to work!!!
      array.each { |x| sum += x }
      if sum.equ?(0)
        return false
      else 
        return true
      end
    end
  end

  def self.find_sum_3(array)
  end 

end
