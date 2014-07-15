# require 'rubygems'
# require 'pry-debugger'

module ArrayUtil
  def self.max(array)
  	if array == []
  		max = nil 
  	else
  		max = array[0]
	  	array.each_index do |x|  		
	  		if array[x] > max
	  			max = array[x]
	  		else 
	  			max
	  		end 
	  	end 
	end
	puts max
  end

  def self.middle_element(array)
  	if array == []
  		middle_element = nil 
  	else
  		if array.length % 2 == 0 
  			x = array.length/2
  			middle_element = (array[x-1]+ array[x])/2.0
  		else 
  			x = (array.length+1)/2.0
  			middle_element = array[x-1]
  		end 
  		puts middle_element
  	end		 
  end

  def self.sum_arrays(array1, array2)
  	arrays_sum = []
  	if array1 == [] || array2 ==[]
  		arrays_sum = nil
  	else 
	  	array1.each_index do |x|
	  		arrays_sum << array1[x]+array2[x]	
	  	end 
	end
	p arrays_sum
  end
end

ArrayUtil.max([])
ArrayUtil.max([-1,2,-1, -4])

ArrayUtil.middle_element([1,1,5, 13, 4])

ArrayUtil.sum_arrays([1,2],[])



