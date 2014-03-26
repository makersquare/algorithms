require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    max = array.first
    array.each do |n|
      if n > max
        max = n
      end
    end
    max
  end

  def self.middle_element(array)
    if array.empty?
      nil
    elsif array.size.odd?
      midpoint = array.size / 2
      array[midpoint]
    else
      i1 = array.size / 2
      i2 = array.size / 2 - 1
      (array[i1] + array[i2]) / 2.0
    end
  end

  def self.sum_arrays(array1, array2)
    res = []
    array1.each_index do |x|
      res << array1[x] + array2[x]
    end
    res
  end
end
