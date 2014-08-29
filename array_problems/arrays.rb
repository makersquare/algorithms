require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    # if array.empty?      dont' need
    #   return nil
    # else
      max = array.first
      array.each do |x|
        if x >= max 
        max = x
        end
      end
    end
    return max
  end

  def self.middle_element(array)
     return nil if array.empty?
      mid = array.length / 2
      if array.length.even?
        return (array[mid] + array[mid - 1]) / 2.0
      else
        return array[mid]
      end 
    end
  end

  def self.sum_arrays(array1, array2)
    solution = [array1.each_index { |x| array1[x] + array2[x]}]
    solution
  end
end
