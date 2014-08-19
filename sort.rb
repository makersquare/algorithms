module Sort

  def self.selection_sort(array)
    #loop through with for loop -- i = index value each time
    last = array.length - 1
    for i in 0..last-1
      return nil if !array[i].is_a?(Numeric)
      min_value, min_index = array[i], i
      #iterate through array to find smallest value -- start with index value to end
      for j in i+1..last 
        return nil if !array[j].is_a?(Numeric)
        if array[j] < min_value
          min_value, min_index = array[j], j
        end
      end
      #switch it for the index value
      array[i], array[min_index] = array[min_index], array[i]
    end
    array
  end

  def self.bubble_sort(array)
    all_sorted=false
    n = 2
    array.each {|x| return nil if !x.is_a?(Numeric)}
    while all_sorted==false
      last = array.length - n
      all_sorted = true
      (0..last).each do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          all_sorted=false
        end
      end
      n += 1
    end
    array
  end

  def self.mergesort(arr)
    return arr if arr.length == 1
    mid = arr.length/2
    array1 = Sort.mergesort(arr[0..mid-1])
    array2 = Sort.mergesort(arr[mid..-1])

    def merge(array1, array2)
      a = 0
      b = 0
      sorted_array = []

      while (a < array1.length && b < array2.length)
        if array1[a] < array2[b] 
          sorted_array.push(array1[a])
          a += 1
        else
          sorted_array.push(array2[b])
          b += 1
        end
      end

      while (a < array1.length)
          sorted_array.push(array1[a])
          a += 1  
      end

      while (b < array2.length)
          sorted_array.push(array2[b])
          b += 1  
      end

      sorted_array
    end
    
    merge(array1, array2)
  end
end