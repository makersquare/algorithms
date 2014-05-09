require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    if array.length == 0
      nil
    elsif array.length == 1
      return array[0]
    elsif array.length > 1
      array.sort[-1]
    end
  end

  def self.middle_element(array)
    if array.length  == 0
      nil
    elsif array.length % 2 != 0
      mid = array.length / 2 + 0.5
      return array[mid]
    elsif array.length % 2 == 0
      mid1 = array.length / 2
      average = (array[mid1] + array[mid1 - 1]) / 2.0
        if average % 2 == 0
          return average
        else
          mid2 = array.length / 2
          average_float = (array[mid2] + array[mid2 -1]) / 2.0
          return average_float
        end
    end
  end

  def self.sum_arrays(array1, array2)
    if array1 == [] && array2 == []
      return []
    else
      array1.zip(array2).map { |x| x.inject(:+)}
    end
  end
end


#Patrick in-class solutions
# def self.max(array)
#   max_value = array[0]
#   for x in 0...array.length
#     max_value = array[x] if array[x] > max_value
#   end
#   max_value
# end


# def self.middle_element(array)
#   return nil if array.length = 0
#   if array.length % 2 == 1
#     array[array.length] / 2
#   else
#     array[array.length / 2] + array[array.length - 1] / 2.0
#   end
# end

# def self.sum_arrays(array1, array2)
#   solution = []
#   for x in 0...array.length
#     solution << array1[x] + array2[x]
#   end
#   solution
# end

