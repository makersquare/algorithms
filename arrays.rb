require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    return nil if array.size == 0
    max = array[0]
    array.each do |x|
      max = x if x > max
    end
    max
  end

  def self.middle_element(array)
    return nil if array.size == 0

    halfarraysize = array.size / 2

    if array.size % 2 == 1
      return array[halfarraysize.floor]
    else
      return (array[halfarraysize] + array[halfarraysize - 1])/2.0
    end
  end

  def self.sum_arrays(array1, array2)
    temp_array = []
    for i in 0..(array1.size - 1)
      temp_array.push(array1[i] + array2[i])
    end
    temp_array
  end
end
