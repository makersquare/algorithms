require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    if array.empty?
      return nil
    else
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
     
    if array.empty?
      return nil
    else
      mid = array.length / 2
      if array.length.even?
        mid_2 = mid - 1
        return (array[mid] + array[mid_2]) / 2.0
      else
        return array[mid]
      end 
    end
  end

  def self.sum_arrays(array1, array2)
    if array1.empty? || array2.emtpy?
      return nil
    elsif 
      array1.each_index { |x| array1[x] + array2[x]}
    end
  end
end
