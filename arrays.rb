require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    largest = 0
    if array.length == 0
      return nil
    elsif array.length == 1
      return array[0]
    else
      array.each do |x|
        if x > largest
          largest = x
        end
      end
    end
    return largest
  end

  def self.middle_element(array)
    if array.length == 0
      return nil
    elsif array.length == 1
      return array[0]
    elsif array.length.even? == false
      i = array.length/2
      return array[i]
    else array.length.even?
      sum = 0
      array.each do |x|
        sum += x
      end
      amount = array.length
      return sum.to_f/amount
    end
  end

  def self.sum_arrays(array1, array2)
    newarr = []
    if (array1.length == 0) || (array2.length == 0)
      return []
    elsif array1.length == array2.length
      i = array1.length
      for x in 0...i
        newarr << array1[x] + array2[x]
      end
    else
      return nil
    end
    return newarr
  end
end
