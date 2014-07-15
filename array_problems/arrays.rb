require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
  	number = array.first
  	array.each do |x|
  	  if number < x
  	  number = x
  	  end
    end
    number
  end

  def self.middle_element(array)
    if array.empty?
      nil 
    else 
      sorted = array.sort
      len = sorted.length
      return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
  end

  def self.sum_arrays(array1, array2)
    result = []
    array1.each_index do |x|
    	sum = array1[x] + array2[x]
    	result << sum
    end
    result
  end
end

array = [1,3,5,7,8,9]
array2 = [3,6,7,8,11,0]

ArrayUtil.max(array)
ArrayUtil.middle_element(array)
ArrayUtil.sum_arrays(array,array2)

