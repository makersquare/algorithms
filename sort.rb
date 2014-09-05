module Sort

  def self.select_sort(array)
    for i in 0...array.length
      minimum = array[i]
      for j in i...array.length
        if minimum > array[j]
          minimum = array[j]
          array[j] = array[i]
          array[i] = minimum
        end
      end
    end
    array
  end

  def self.bubble_sort(array)
    if array.empty?
      return array
    end
    go = true
    while go
      for i in 0...(array.length-1)
        if array[i] > array[i+1]
          minimum = array[i+1]
          array[i+1] = array[i]
          array[i] = minimum
          counter = 0
          for j in 0...(array.length-1)
            if array[j] <= array[j+1]
              counter += 1
              if counter == array.length - 1
                go = false
              end
            end
          end
        end
      end
    end
    array
  end
end
