require 'rubygems'

module ArrayUtil
  def self.max(array)
  	# array.sort.last #quick

  	#without sort?
  	# array.each_index do |x|
  	# 	if array[x] > array[x+1]
  	# 		return array[x]
  	# 	else
  	# 		return array[x+1]
  	# 	end
  	temp = array.first
  	array.each do |x|
  		temp = x if temp < x
  	end
  	temp
  end

  def self.middle_element(array)
  	# array[(array.size-1)/2]
  	length = array.length
  	if length == 0
      return nil 
  	elsif length%2 == 1
  		return array[length/2]
  	else
		return (array[length/2.0] + array[length/2.0 -1])/2.0
	end
    #Austin's Solution:
    #return nil if array.length == 0
    #array.count.even? ? array.inject(:+).to_f/array.count : array[array.count/2]
  end

  def self.sum_arrays(array1, array2)
	return_array =[]
	array1.each_index do |value|
		return_array << array1[value] + array2[value]
	end
	return_array
  end
end
