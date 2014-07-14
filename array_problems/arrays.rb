require 'rubygems'
#require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    answer = 0
  	array.each do |x|
  		if x > answer
  			answer = x
  		end
  	end
  	answer
  end

  def self.middle_element(array)
  	if array % 2 != 0
  		array[(array.length - 1)/ 2]
  	else
  		((array.length / 2) + (array.length / 2) - 1) / 2
  	end
  end

  def self.sum_arrays(array1, array2)
  	answer = Array.new
  	array1.each_index do |x|
  		answer << array1[x] + array2[x]
  	end
  	answer
  end
end
