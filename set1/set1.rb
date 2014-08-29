module Set1
  def self.swap_small(array)
    small = array[0]
    ar2 = [0]
    array[1..-1].each do |x|
      if x < small
        ar2.push(small)
        small = x
      else
        ar2.push(x)
      end
    end
    ar2[0]=(small)
    ar2
  end

  def self.find_sum_2(array, sum = 0)
    return false if array.empty?
    array.each do |ar1|
      array.each do |ar2|
        return true if (ar1 + ar2) == 0
      end
    end
    return false
  end

  def self.find_sum_3(array)
    return false if array.empty?
    array.each do |ar1|
      array.each do |ar2|
        array.each do |ar3|
          return true if (ar1+ar2+ar3)==0
        end
      end
    end
    return false
  end
end
