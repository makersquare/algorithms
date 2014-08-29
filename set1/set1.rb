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

  # def self.find_sum_2(array, sum = 0)
  #   if array.length == 0 
  #     return false
  #   elsif array.include?(0)
  #     return true
  #   elsif array.each { |x| array.include?(x) && array.include?(-x) }
  #     return true
  #   else # Can not get this one to work!!!
  #     array.each { |x| sum += x }
  #     if sum.equ?(0)
  #       return false
  #     else 
  #       return true
  #     end
  #   end
  # end

  def self.find_sum_2(array, sum = 0)
    array.each do |elem1|
      array.each do |elem2|
        if elem1 + elem2 == sum
          return true
        end
      end
    end
    false
  end

  def self.fin_sum_2(array, sum = 0)
    hash = {}
    array.each do |elem1|
      hash[elem1] = true
    end
    array.each do |elem1|
      if hash[sum - elem1]
        return true
      end
    end
    false
  end

  def self.find_sum_3(array)
   array.each do |elem1|
    array.each do |elem2|
      array.each do |elem3|
        if elem1 + elem2 + elem3 == 0
        return true
        end
      end
    end
  end
  false
  end
end
