module ArrayUtil
  def self.max(array)
	max = 0  
  	array.each do |x|
  		if x > max 
  			max = x
  		end
  	end
  	max
  end

  def self.middle_element(array)
  	if(array.size%2 == 0)
  		half_array = (array.size-1).to_f/2.0
  		( array[ (half_array).floor ] + array[ (half_array).ceil ] )/2
  	else
  		array[ ((array.size-1)/2) ]
  	end
  end

  def self.sum_arrays(array1, array2)
  	if (array1.size == array2.size)
	  	sum = array1.map.with_index {|x, i| x + array2[i]}
	else
		puts "Array lengths don't match."
	end
  end
end
