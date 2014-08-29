module Set1

	#O(n)
  def self.swap_small(array)
  	first_element=array[0]

  	smallest_value = array[0]
  	smallest_index = 0

  	array.each_with_index do |item, index|
  		if array[index] < smallest_value
  			smallest_value = array[index]
  			smallest_index = index
  		end
  	end

  	array.insert(0, smallest_value)
  	array.delete_at(1)
  	array.delete_at(smallest_index)
  	array.insert(smallest_index, first_element)
  end
  #O(n^2)
  def self.find_sum_2(array, sum = 0)
  	

  	array.each do |x| 
  		 array.each do |a|
  		 	if x + a == 0
  		 		return true
  		 	end
  		end
  	end

  	return false

  end

  #O(n^3)
  def self.find_sum_3(array)
  	array.each do |a|
  		array.each do |b|
  			array.each do |c|
  				if a + b + c == 0
  					return true
  				end
  			end
  		end
  	end

  	return false
  end
end
