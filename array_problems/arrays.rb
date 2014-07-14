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
  	if array == []
  		return nil
  	end

  	if array.length == 1
  		return array[0]
  	end

  	if array.length % 2 == 1
  		half = (array.length/2)
  		return array[half]
  	end

  	if array.length % 2 == 0
  		middle = (array[array.length/2] + array[array.length/2-1])/2.0
  		if middle.class == Float
  			return middle
  		else
  			return middle.to_i
  		end
  	end
  end


  def self.sum_arrays(array1, array2)
  	if array1 == [] && array2 == []
  		return []
  	end

  	if array1.length == 1 && array2.length == 1
  		sum = []
      sum << array1[0] + array2[0]
      return sum
      # original: return Array(sum)
  	end

  	if array1.length >= 2 && array1.length == array2.length
  		i = 0
  		sum = []
  		for i in 0...array1.length
  			sum << array1[i] + array2[i]
  			i += 1
  		end
      # array1.size.times do |index|
      #   sum << (array1[index] + array2[index])
      # end
      sum
  	end  	
  end
end
