require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    tester = array[0]
    array.each do |num|
      if num >= tester
                tester = num
      end
    end
    return tester
  end

  def self.middle_element(array)
    if array.length == 0
      return nil
    elsif array.length % 2 != 0
      index = (array.length - 1) / 2
      return array[index]
    else
      index1 = (array.length / 2)
      index2 = index1 - 1
      sum = array[index1] + array[index2]
      if (sum/2) % 2 != 0
        return sum/2
      else
        return sum.to_f / 2.0
      end

    end
  end

  def self.sum_arrays(array1, array2)
    new_array = []
    if array1.length == array2.length
      i = 0
      while i != array1.length do
          sum = array1[i] + array2[i]
          new_array << sum
          i += 1
      end
      return new_array
    end
  end
end
