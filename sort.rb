module Sort

  def self.selection_sort(array)
    #loop through with for loop -- i = index value each time
    last = array.length - 1
    for i in 0..last-1
      return nil if !array[i].is_a?(Numeric)
      min_value = array[i]
      min_index = i
      #iterate through array to find smallest value -- start with index value to end
      for j in i+1..last 
        return nil if !array[j].is_a?(Numeric)
        if array[j] < min_value
          min_value = array[j]
          min_index = j
        end
      end
      #switch it for the index value
      array[i], array[min_index] = array[min_index], array[i]
    end
    array
  end
end