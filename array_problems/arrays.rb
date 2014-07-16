require 'rubygems'

module ArrayUtil
  def self.max(array)
  	max_number = array[0]
  	array.each_index do |x|
  		if array[x] > max_number
  			max_number = array[x]
  		end
  	end
  	max_number
  end

  def self.middle_element(array)
  	if array.length == 0
  		nil
  	elsif array.length % 2 == 0
  		(array[array.length/2] + array[(array.length/2)-1])/2.0
  	else
  		array[array.length/2]
  	end
  end

  def self.sum_arrays(array1, array2)
  	summed_array = []
  	array1.each_index do |x|
  		summed_array.push(array1[x] + array2[x])
  	end
  	summed_array
  end
end
