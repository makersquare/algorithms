require 'rubygems'

module ArrayUtil
  def self.max(array)
  	comparator = array[0]
  	array.each do |x|
  		if x > comparator
  			comparator = x
  		end
  	end
  	comparator
  end

  def self.middle_element(array)
  	if array.first == nil
  		return nil
  	elsif (array.length % 2) == 0
  		puts "even number array"
  		middle_element = (array[array.length / 2] + array[(array.length / 2)-1]).to_f / 2
  	else 
  		puts "odd number array"
  		middle_element = array[array.length / 2]
  	end 
  end

  def self.sum_arrays(array1, array2)
  	combined_array = []
  	if (array1.length + array2.length) % 2 == 0
  		array1.each_index {|x| combined_array.push(array1[x] + array2[x]) }
  	else puts "Arrays must be the same length."
  	end
  	p combined_array
  end
end

# arr = [64,33,94,63,11,16,22,27,56,87]
# arr2 = [64,33,94,63,11,16,22,27,56,87]
# x = self.sum_arrays(arr, arr2)
