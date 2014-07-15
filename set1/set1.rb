module Set1
	# complexity O(n)
  def self.swap_small(array)
  	if array.size == 1
  		return array
  	elsif array.size == 2
  		if array.min == array[0]
  			array
  		else
  			array[0], array[1] = array[1], array[0]
  			return array
  		end
  	else
  		if array.min == array[0]
  			array
  		else
  			min_index = array.index(array.min)
  			holder = array[0]
  			array[0] = array[min_index]
  			array[min_index] = holder
  			# Below won't work since "min_index" must be calculated first
  			# array[0], array[array.index(array.min)] = array[array.index(array.min)], array[0]
  			array
  		end
  	end
  end
	# complexity O(n^2)
  def self.find_sum_2(array, sum = 0)
  	if array == []
  		false
  	elsif array == [0]
  		true
  	elsif array.include?(0) == true
  		true
  	else
  		for i in 0...array.size
  			for j in i...array.size
  				if array[i] + array[j] == sum
  					return true
  				end
  			end
  		end
  		false
  	end
  end
	# complexity O(n^3)
  def self.find_sum_3(array)
  	for i in 0...array.size
  		for j in i...array.size
  			for k in j...array.size
  				if array[i] + array[j] + array[k] == 0
  					return true
  				end
  			end
  		end
  	end
  	false
  end

end
