require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    #[3,6,1,7,8]
    max = array[0]

    if (array.length == 0)
      return nil
    end

    array.each do |e|
      if (e > max)
        max = e
      end
    end

  max

  end

  def self.middle_element(array)
    #[0,1,2,3,4,5,6,7,8,9]

    if (array.length == 0)
      return nil
    end
    arr_length = array.length #9
    middle_element = arr_length / 2

    if (arr_length % 2 == 0)
      middle_num = (array[middle_element].to_f + array[middle_element - 1]) / 2
    else
      middle_num = array[middle_element]

    end

    middle_num
  end

  def self.sum_arrays(array1, array2)
    #[3,4,1,7]
    #[1,2,3,4]

    sum_arr = []
    arr_length = array1.length
    counter = 0

    if (arr_length == 0)
      return sum_arr
    end

    while counter != arr_length
      sum_arr.push(array1[counter] + array2[counter])
      counter += 1

    end

    sum_arr
  end
end
