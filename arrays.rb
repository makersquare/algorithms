require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    y = array[0]
    array.each { |x|
      if x > y
        y = x;
      end
    }
    return y
  end

  def self.middle_element(array)
    if array[0] == nil
      return nil
    end
    if array.length % 2 == 0
      datvar = array[(array.length / 2 - 1)]
      disvar = array[(array.length / 2    )]
      puts ((datvar.to_f + disvar.to_f)/2.to_f)
      return ((datvar + disvar)/2.to_f)
    else
      return array[array.length / 2]
    end
    puts "This didn't work AT ALL, WHAT!?"
  end

  def self.sum_arrays(array1, array2)
    thisarray = []
    if (array1[0] == nil || array2[0] == nil)
      return thisarray
    end

    array1.each_index { |x|
      thisvar = array1[x] + array2[x]
      thisarray << thisvar
    }
    return thisarray
  end

end
