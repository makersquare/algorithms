require 'rubygems'
#require 'pry-debugger'

module ArrayUtil 

  def self.max(array)
  	max = 0
  	array.each{ |i| if i.to_i>max then max=i.to_i end}
  		max
  end

  def self.middle_element(array)
  	mid = array.size/2
 	if (array.size%2==0)
 		(array[mid] + array[mid-1])/2.0
  	else
  		array[mid]
 	end
  end

  def self.sum_arrays(array1, array2)
  	if array1.size!=array2.size then return 'Arrays are not the same length' end
  	array1.map!.with_index{ |x, i| array2[i]+x}
  	array1
  end 

end


arr = [1,2,3,4,5,9,3,2,1,0]
puts ArrayUtil.max(arr)
puts ArrayUtil.middle_element([1,3,4,5])
puts ArrayUtil.sum_arrays([1,2,3],[1,2,3])