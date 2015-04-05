# require 'rubygems'
# require 'pry-debugger'

module ArrayUtil
  def self.max(array)
   max = array[0]
    array.each do |x|
        if x > max
        max = x
        end
    end
  return max
  end

  def self.middle_element(array)
   middle = (array.count) / 2
   middle2 = middle - 1
   if (array[middle2]) == nil
      return nil
    elsif array.count%2 == 0
      return (array[middle2].to_f + array[middle])/2
    else
      return array[middle]
    end
  end

  def self.sum_arrays(array1, array2)
    array = []
    array1.each_index do |x|
      array.push(array1[x] + array2[x])
      end
       return array
  end
end
