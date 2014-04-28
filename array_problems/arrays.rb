require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    case
    when array.empty?
      nil
    when array.length == 1
      return array[0]
    when array.length > 1
      array.sort!.uniq!
      return array.last
    when array.include?(NaN)
      return "There's something wrong with your array"
    end



  end




  def self.middle_element(array)
    case
    when array.empty?
      nil


    end

  end

  def self.sum_arrays(array1, array2)


  end
end


