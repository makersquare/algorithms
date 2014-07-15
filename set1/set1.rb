module Set1
  def self.swap_small(array)
      if array == []
        min = nil
      else  
        min = array[0]
        array.each_index do |x|
          if array[x] < min 
             min = array[x]
          else
             min  
          end
       end 
      i = array.index('min')

      # a, b = b, a
      # array[i], array[0] = array[0], array[i]
      # return array

       arr_new = []
       len = array.length 
       arr_new[0] = min 
       for i in 1 ... len
          if array[i]!= min 
            arr_new[i] = array[i] 
          else 
            arr_new[i] = array[0]
          end
        end  
        arr_new 
      end 
  end

#  i believe swap this is n
p Set1.swap_small([-5,2,-7])


  def self.find_sum_2(array, sum = 0)
      sum_desidered = sum 
      result = []
      array.each do |x| 
      array.each do |y| 
    if x+y == sum_desidered
      result << true 
    else
      result << false
    end
    end
    end   
    result
    a = result.find {|x| x == true}
    if a == nil
      a = false 
    end
    a 
  end
p Set1.find_sum_2([5,-5, -5, 7, 2, 2])

#  i believe sum2 this is n^2

  def self.find_sum_3(array)
  sum_desidered = 0 
      result = []
      array.each do |x| 
        array.each do |y| 
          array.each do |z|   
            if x+y+z == sum_desidered
              result << true 
            else
              result << false
            end
          end
        end 
      end  
      result
      a = result.find {|x| x == true}
      if a == nil
        a = false 
      end
      a 
  end
end 


p Set1.find_sum_3([10,-5, -5, 7, 2, 2])

