require 'rubygems'
require 'pry-debugger'

module ArrayUtil

# This method takes the highest number of an array
# without using the max function.
def self.max(array)
  number = 0
  if array.empty?
    return nil
  elsif array.length == 1
    return array[0]
  else
    array.each do |x|
      if x > number
        number = x
      end
    end
    return number
  end
end

# This function returns the middle element of an array.
def self.middle_element(array)
  if array.empty?
    return nil
  elsif array.length == 1
    return array[0]
  else
    if array.length % 2 == 1
      middle_number = (array.length / 2).ceil
      return array[middle_number]
    elsif array.length % 2 == 0
      index = array.count/2
      (array[index].to_f + array[index-1].to_f) /2
    end
  end
end

# This function takes the sum of two arrays.
def self.sum_arrays(array1, array2)
  sum_arrays = []
  if array1.empty? && array2.empty?
    sum_arrays = []
    return sum_arrays
  elsif array1.length == 1 && array2.length == 1
    sum_arrays = [array1[0] + array2[0]]
  else
    for i in 0...array1.length
      the_sum = array1[i] + array2[i]
      sum_arrays << the_sum
    end
    return sum_arrays
  end
end

end
