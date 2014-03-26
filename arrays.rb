require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
  	max = array[0]
	  	array.each do |element|
	  		if element > max
	  			max = element
	  		end
	  	end
	  	return max
  	end

  def self.middle_element(array)
  	middle_element = array[0]
  	if array.length == 0
  		return nil
  	elsif array.length % 2 == 1
  		return array[array.length/2]
  	else
  		halfway = array.length/2.0
  		return (array[halfway] + array[halfway - 1])/2.0
  	end
  end

  def self.sum_arrays(array1, array2)
    @new_array = Array.new(0)
    if array1 == [] && array2 == []
      return []
    elsif array1.length == 1 && array2.length == 1
      return [array1[0] + array2[0]]
    else
      array2.each_index do |index|
      @new_array[index] = array1[index] + array2[index]
      end
      @new_array
    end
  end
end
