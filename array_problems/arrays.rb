require 'rubygems'
require 'pry-byebug'

module ArrayUtil

  def self.max(array)
    max = 0
    index = 0
    array.each_with_index do |x, i|

      if (x > max)
        max = x
        index = i
      end

    end

  array[index]
  end

  def self.middle_element(array)

  if array.empty?
    return nil
  end

  if array.size == 1
    return array[0]
  end

  elems = array.size
  #if there is an even number of elems , avg the two middle elems
  if elems % 2 == 0
    first_index = elems/2 - 1
    second_index = elems/2 
    avg = (array[first_index] + array[second_index])/2.0 
    return avg
  #else there is an odd number of elems, get the middle elem  
  else
    index = (elems/2.0).floor
    mid = array[index]
    return mid
  end


end


  def self.sum_arrays(array1, array2)

    size = array1.size
    sum = []
    array2.each_with_index do |x, i|
      term = x + array1[i]
      sum << term
    end 

    sum
  end
end
