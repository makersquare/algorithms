require 'rubygems'
require 'pry-debugger'
# binding.pry
module ArrayUtil
  def self.max(array)
    max = array[0]  # [5,12,332,4,23,24,24424,24,2]
    ##dontchange above
    array.each do |a|
      if max < a # i can't compare other numbers to a, the element of array in here
        return a # so i need a constant OUTSIDE of the loop to compare it too
      end          # first time, max is 5, a is 5, won't run block,
    end           # 2nd time, a is 12        , max is 5, 5 is LESS then 12, therefore, run block return a, breaks out?
    return max
  end


  def self.middle_element(array)
    if array.empty?   # will return nil, if array is empty
        nil
    elsif array.length ==1  # if array length is one
      return array[0]       # will return index 0 of array
    elsif array.length % 2 != 0 # if array is odd
      midpoint = array.length/2 # will take the length, divide by 2, which gives the middle point
      return array[midpoint ] # give the middle point as the index for the array, returns element at index midpoint
    else array.length % 2 == 0  # if array is even
      (array[array.length/2] + array[(array.length/2)-1])/2.to_f # will add the midpoint of the array, and also add
    end  #                          midpoint of array -1    [1,2,3,4]
  end                         # [1,2,3,4] array[2] = 3     array[1] = 2   3+2/2  ==== to floates.

  def self.sum_arrays(array1, array2)
    if array1.empty? && array2.empty?  # if both empty --> return empty array
      return []
    elsif array1.length == 1 && array2.length == 1  # if both length one,
      sum_arr = [] # make an empty array called sum_arr   [1] + [2]
      addition =  array1[0] + array2[0]  #then add the index of 0 for both --> 3
      return sum_arr << addition  # sum_arr = [3]
    else
      added_array = [] # empty array
      array1.each_index do |i|  # each_index # only works if BOTH array are of the same length. [1,2] + [4,5,6] -> [5,7,6]
      added_num = array1[i] + array2[i]  # well loop through array1, each index, beause array2 same length accces sasme index
      added_array << added_num
    end
    return added_array

  end
end
end
