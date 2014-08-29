require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    return nil if array.empty?
    highest = array[0]
    array[1..-1].each {|x| highest = x if highest < x }
    return highest
  end


  def self.middle_element(array)
    return nil if array.empty?
    length = array.sort!.length
    if length % 2 == 0
      return (array[length/2-1] + array[length/2])/2.0
    else
      return array[length/2]
    end
  end

  def self.sum_arrays(array1, array2)
    arr = []
    0.upto(array1.length-1) {|x| arr[x] = array1[x]+array2[x]}
    return arr
  end
end
