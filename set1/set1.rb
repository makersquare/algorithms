module Set1
  def self.swap_small(array)
  	temp = 0
  	array.each_index do |index|
  		if array[index] < array[temp]
  				temp = index
  		end
  	end
  	array[0], array[temp] = array[temp], array[0]
  	array
  end

  def self.find_sum_2(array, sum = 0)
  	return false if array.empty? 
  	return true if array.include?(0)
  	array.each do |x|
			array.each do|y|
				if x + y == 0
			 		return true
				end
			end
	end
	false
end

  def self.find_sum_3(array)
  return false if array.empty?	
  	array.each do |x|
			array.each do|y|
				array.each do |z|
					if x + y + z == 0
			 			return true
			 		end
			 	end
			end
		end
		false
  end
end

array = [5,6,2,9]

p Set1.find_sum_2(array)

p Set1.swap_small(array)

 # => [2, 7, 5, 9]
