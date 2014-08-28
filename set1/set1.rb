module Set1
  def self.swap_small(array)
    #swap_small([5,7,2,9]) # => [2, 7, 5, 9]
    #O(n)

    smallest = array[0]
    smallest_index = 0
    first = array[0]

    i = 0
    while i < array.length
      if array[i] < smallest 
        smallest = array[i]
        smallest_index = i
      end
      i += 1
    end

    array.insert(smallest_index, first)
    array.delete_at(smallest_index + 1)

    array.shift
    array.unshift(smallest)
    
    array
    
  end

  def self.find_sum_2(array, sum = 0)
    
  end

  def self.find_sum_3(array)
  end
end
