module Set1
  def self.swap_small(array)
    min = {index:0, value:array.first}
    array.each_index do |index|
      if min[:value] > array[index]
         min[:index] = index
         min[:value] = array[index]
      end
    end
    array[min[:index]] = array[0]
    array[0] =min[:value]
    array
  end

  def self.find_sum_2(array, sum = 0)

      test = false

      nil if array.size==0 

      array.each_index do |index|

        test = true if array[index] == 0
        index2 = index+1
        while index2 <=array.size-1 do 
          #puts "#{index} and #{index2}"
         if (array[index]+array[index2])==sum 
          test=true 
         end
         index2+=1
        end
      end
      test

  end

  def self.find_sum_3(array)
    #can also be easily changed for sum_2
    test = false
    test = true if array.include? 0
    array *= 3
    arr = array.combination(3).to_a
    arr.each do |i|
      if i.inject(:+) == 0
        test = true;
      end
    end
    test
  end

end
