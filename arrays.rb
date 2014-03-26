require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    test = array[0]

    if array.length == 0
      return nil
    elsif array.length == 1
      return array[0]
    #elsif array.length == 2
     # if array[1] > array[0]
      #  return array[1]
     # else
     #   return array[0]
     #end
    else
      array.each do |num|
        if num >= test
          test = num
        end
      end
    return test


    end
  end

  def self.middle_element(array)
    return nil if array.size == 0

      halfarraysize = array.size / 2

    if array.size % 2 == 1
      return array[halfarraysize.floor]
    else
      return (array[halfarraysize] + array[halfarraysize - 1])/2.0
      end
    end

    return test


  end

  def self.sum_arrays(array1, array2)
    temp_array = []

    for i in 0..(array1.size - 1)
      temp_array.push(array1[i] + array2[i])
    end
    temp_array
  end

  end
end
