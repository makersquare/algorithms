require 'rubygems'
module ArrayUtil
  def self.max(array)
    comparator = array[0]
  	array.each do |i|
  		if i > comparator
  			comparator = i
  		end
  		
  	end
  	comparator
 
  end
 
  def self.middle_element(array)
    mid_value = array.length / 2
    
    if array == []
      nil
    elsif array.length % 2 != 0 
  	  array[mid_value]
    else 
      (array[mid_value - 1] + array[mid_value]) / 2.0
    end
 
  end  	
 
 
 
 
def self.sum_arrays(array1, array2)
	array3 = []
  if array1.length == array2.length
  	array1.each_index do |i|
  		array3 << (array1[i] + array2[i])
  	end
  end
  array3
end
end