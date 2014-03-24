require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    val = array[0]
    array.each do |number|
      if number > val
        val = number
      end
    end
    return val
  end

  def self.middle_element(array)
    if array[0] == nil
      return nil
    elsif array[1] == nil
      return array[0]
    elsif array.length%2==0
      val = array.length/2
      ans = (array[val].to_f + array[val -1])/2
      ans
    else
      val = array.length/2
      ans = (array[val])
      ans
    end
  end

  def self.sum_arrays(array1, array2)
    array = array1.map.with_index{ |num,i| num + array2[i] }
  end
end




















# module ArrayUtil
#   def self.max(array)
#     if array[1] == nil
#       return array[0]
#     else
#     val = array[0]
#     array.each do |number|
#       if number > val
#         val = number
#       end
#     end
#     return val
#   end

#   def self.middle_element(array)
#     # if array[1] == nil
#     #   return array[0]
#     # else
#     #   if array.length%2==0
#     #     val = array.length/2
#     #     ans = (array[val] + array[val -1])
#     #   else
#     #     val = array.length/2
#     #     ans = (array[val])
#     #   end
#     # end
#     # return ans

#   end

#   def self.sum_arrays(array1, array2)
#   end
# end
# end
