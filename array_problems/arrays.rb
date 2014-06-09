require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
  	i = 0
  	limit = array.length

  	if array == []
  		answer = nil
  	end

  	array = array.uniq
  	
  	if array.length == 1
  		answer = array[0]
  	end

  	if array.length == 2
  		for i in 0...limit
  			if array[i] >= array[i+1]
  	 			answer = array[i]
  	 		else
  	 			answer = array[i+1]
  	 		end
  	 		return answer
  		end
  		if array[limit] > answer
  			answer = array[limit]
  		end
  	end


  	if array.length > 2
  		for i in 0...limit
  			if array[i] >= array[i+1] && array[i] >= array[i+2]
  	 			answer = array[i]
  	 		elsif array[i] <= array[i+1] && (array[i+1] >= array[i+2])
  	 			answer = array[i+1]
  	 		else array[i+2] >= array[i] && array[i+2] >= array[i+1]
  	 			answer = array[i+2]
  	 		end
  	 		return answer
  		end
  		if array[limit] > answer
  			answer = array[limit]
  		end
  	end

  	return answer
  end

  def self.middle_element(array)
  end

  def self.sum_arrays(array1, array2)
  end
end
