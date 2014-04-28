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
    when array.length == 1
      return array[0]
    when array.length % 2 != 0
      array[((array.length - 1)/2)]
    when array.length % 2 == 0
      ((array[((array.count - 1)/2)].to_f+array[((array.count)/2)].to_f)/2)
    end

  end

  def self.sum_arrays(array1, array2)
    case
    when array1.empty? && array2.empty?
      Array.new
    when array1.count && array2.count == 1
      Array.new << (array1[0] + array2[0])
    when array1.count && array2.count > 1
      x = 0
      totals = []
      while x < array1.length
        totals << (array1[x] + array2[x])
        x += 1
      end
      totals

    end


  end
end


