require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
  	highest = 0
  	if array.length == 0
  		return nil
  	elsif array.length == 1
  		array.first
  	else
  		array.each do |i|
	  		if i > highest
	  			highest = i
	  		end
	  	end
	  	highest
  	end
  end

  def self.middle_element(array)
  	index = 0
  	index1 = 0
  	if array.length == 0
  		return nil
		elsif array.length == 1
  		array.first
  	elsif array.length % 2 != 0
  		index = array.length / 2 
  		array[index]
  	else
  		index = array.length / 2 - 1
  		index1 = array.length / 2
			(array[index] + array[index1]) / 2.0
  	end
  end

  def self.sum_arrays(array1, array2)
  	index = 0
  	sum = []
  	if array1.length == 0 && array1.length == 0
  		[]
  	elsif array1.length == 1 && array2.length == 1
  		array3 = [array1.first + array2.first]
  	else
  		for i in 0...array1.length
  			addition = array1[i] + array2[i]
  			sum << addition
  		end
  		sum
  	end
  end
end
