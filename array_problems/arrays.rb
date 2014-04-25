require 'rubygems'
# require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    maximum = array[0]
    array.each_index do |x|
      if array[x] > maximum
        maximum = array[x]
      end
    end

    return maximum
  end

  def self.middle_element(array)
  	return nil if array.size ==0

    if array.size % 2 == 1
      return array[array.size/2]
    else
      return (array[array.size/2].to_f+ array[array.size/2-1] ) /2
    end

  end

  def self.sum_arrays(array1, array2)
    return [] if (array1.size == 0 && array2.size == 0)
    sum = []
    array1.each_index do |x|
      sum << array1[x] + array2[x]
    end
    return sum
  end
end