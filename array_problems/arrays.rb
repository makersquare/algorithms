require 'rubygems'

module ArrayUtil
  
  def self.max
  	val = self.first
  	arr.each do |x|
  		if x > val
  			val = x
  		end
  	end
  end

  def self.middle_element(array)
  	len = array.length 
  	if len % 2 == 1
  		return array[len/2] 
  	else
  		return array[len/2] + array[len/2 - 1] 
  	end
  end

  def self.sum_arrays(array1, array2)
  	myArray = []
  	array1.each_index do |vr|  
  		myArray << array2[vr] + array1[vr]
  	end
  	myArray
  end
end

p ArrayUtil.sum_arrays([4,2,6], [8,5,6]) # => [12, 7, 12]

