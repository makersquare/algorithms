require 'rubygems'
require 'pry-byebug'

module ArrayUtil



  def self.max(array)

  	x = array[0]

  	array.each_with_index do |item, index| 
  		if (array[index] > x)
  			x = array[index]
  		end
  	end
		x
  end








  def self.middle_element(array)
  
  	if array.length % 2 == 1
  		return array[array.length]
  	# else
  	# 	return [array[z], array[(z+1)]]
  	end
  end










  def self.sum_arrays(array1, array2)

  end
end
