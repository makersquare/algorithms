module Set1

  # O(n)+O(1) - finding the smallest touches each element O(n), swapping adds O(1) time
  def self.swap_small(array)
    return nil if array.empty?
    min = array[0]
    store_index = 0
    array.each_index do |ind| 
      if array[ind] < min
        min = array[ind] 
        store_index = ind
      end
    end
    array[0], array[store_index] = array[store_index], array[0]
    array
  end

  #O(n2) - have to check each element against each other to find the sum
  def self.find_sum_2(array, sum = 0)
    
  end

  #O(n2^)
  def self.find_sum_3(array)
  end
end
