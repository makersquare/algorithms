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
      array.sort!
      return array.last
    else
      puts "It's not working"
    end



  end




  def self.middle_element(array)
  end

  def self.sum_arrays(array1, array2)


  end
end


