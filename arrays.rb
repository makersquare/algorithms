require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    if array.length == 0
      return nil
    end

    check = array[0]
    array.each do |i|
    if i >= check
      check = i
    end
  end
  check
  end

  def self.middle_element(array)
    if array.length == 0
      return nil
    end

    if array.length % 2 == 0
    (array[array.length/2-1] + array[array.length/2])/2.0
    else
      array[(array.length/2.0).ceil-1]
    end
  end

  def self.sum_arrays(array1, array2)
    new_arr = []

    if array1.length == array2.length
      for i in 0...array1.length
        new_arr << (array1[i] + array2[i])
      end
      else
        return nil
    end
    new_arr
  end

end

