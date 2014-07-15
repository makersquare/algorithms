require 'rubygems'

module ArrayUtil
  def self.max(array)
  	temp = array.first;
  	array.each do |i|
  		if temp < i
  			temp = i
  		end
  	end
  	temp
  end

  def self.middle_element(array)
  	if array.empty?
  		return nil
  	end
  	if array.length % 2 == 0
  		middle_top = array.length/2
  		return (array[middle_top].to_f + array[middle_top - 1].to_f)/2
  	else
  		return array[(array.length/2)]
  	end
  end

  def self.sum_arrays(array1, array2)
  	temp_array = []
  	array1.each_index do |i|
  		temp_array[i] = array1[i] + array2[i]
  	end
  	temp_array
  end
end


list1 = [2, 5, 3, 8]
list2 = [9, 4, 7, 10]

puts ArrayUtil.sum_arrays(list1, list2)
