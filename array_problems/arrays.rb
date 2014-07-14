require 'rubygems'

module ArrayUtil

  def self.max(array) 
	temp = array.first
	array.each do |x|
		temp = x if temp < x
	end
	temp
  end

  def self.middle_element(array)
  	# if array is odd
  	middle_element = array.size/2.0
  	return nil if array.length == 0
  	if array.size % 2 != 0
  		# return middle number
  		array[middle_element].floor
  	elsif array.size % 2 == 0
  		# return average of two middle numbers, a[i.floor] and a[i.ceiling]
  		(array[middle_element-1] + array[middle_element])/2.0
  	end
  	# if array is odd
  end

  def self.sum_arrays(array1, array2)
  	new_array = []
  	if array1.size == array2.size
  		array1.each_index do |i|
  			new_array << array1[i] + array2[i]
  		end
  		return new_array
  	end
  end

end
