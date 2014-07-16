module Set1
  def self.swap_small(array)
  	min = 0
	array.each_index do |i|
  		if array[i] < array[min]
  			min = i
  		end
  	end
  	temp = array[0] # 4
  	array[0] = array[min]  # 2
  	array[min] = temp # 4
  	array
  end
  #linear O(n)
  #array[4, 5, 7, 2, 4, 3]

  def self.find_sum_2(array, sum = 0)
	return true if array.include? sum #check if 0 is in the array
	hash = {} #initialize hash table

	(0...array.length).each do |num|
		hash[array[num]] = num # array element is the key, array index is the value
	end
	#O(n)

	(0...array.length).each do |e| #iterate through array
		if hash[sum - array[e]] != nil #if sum (0) - value of array[e] exists in hash table
		                               #solution found
			return true 
		end
	end
	#O(1)
	return false
  end
  #find_sum_2 runtime: O(n)

  #approach 1 would be to check all combinations O(n^(2)) slow
  #approach 2 would be to sort the array. O(n log n) still slow
  #fill a hash table. O(n) fastest





  def self.find_sum_3(array) #3sum
  	return true if array.include? 0
  	array.sort!
  	#O(n^(2))
  	(0...array.length - 3).each do |i|
  		a = array[i] #values a b c
  		k = i + 1 #pointers i(iterable), k initialized at [1] after i
  		l = array.length - 1 #pointer at end of array
  		while k < l #while k points to value after index i and is before index l
  			b = array[k] #b is value for pointer k
  			c = array[l] #c is value for pointer l
  			if a + b + c == 0 #solution
  				#puts "#{a}, #{b}, #{c}"
  				return true
  			elsif a + b + c > 0 
  				l = l - 1 #shift l pointer to a lower value (left)
  			else
  				k = k + 1 #shift k pointer to a higher value (right)
  			end
  				#repeat
  		end
  	end
  	#if true not returned, 3 values that add to 0 do not exist, therefore return false

  	return false
  end
end