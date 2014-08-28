require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    #I found this solution in the Pry Debugger notes. I think it would take some time to execute because I assume it goes through every item in the array, since it's an inject. 
    array.inject {|y, x| x > y ? x : y }
  end

  def self.middle_element(array)
    #I don't think these would require too much time because the if/else is based on the array length, which is pre-defined in the array.
    if array.length == 0
      nil
    elsif array.length % 2 == 0
      mid = array.length/2
      (array[mid] + array[mid - 1])/2.to_f
    else
    mid = array.length/2
    array[mid] 
    end
  end

  def self.sum_arrays(array1, array2)
    #This one might take some time because the each will have to run through every element of two arrays. 
    sum = []
    array1.each_index {|i| sum.push(array1[i] + array2[i]) }
    sum
  end
end
