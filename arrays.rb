require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    @tester = array[0]

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
        if num >= @tester
          @tester = num
        end
      end
      return @tester


    end
  end

  def self.middle_element(array)



  end

  def self.sum_arrays(array1, array2)
  end
end
