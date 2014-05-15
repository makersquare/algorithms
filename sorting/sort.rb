module Sort

  def self.selection_sort(array)
    array.length.times do |first|
      min = first
      first.upto(array.length-1) do |i|
        min = i if array[i] < array[min]
      end
      array[first], array[min] = array[min], array[first]
    end
    array
  end

  # def self.selection_sort(array)
  #    for i in 0..array.length - 1
  #     min = i
  #       for j in (i + 1)..(array.length - 1)
  #         if array[j] < array[min]
  #           min = j
  #         end
  #       end
  #     array[min], array[i] = array[i], array[min]
  #   end
  #   array
  # end

  def self.merge(array1, array2)
    result = []
    left, right = 0
    until left == array1.size || right == array2.size
      if array1[left] < array2[right]
        left += 1
      elsif array1[left] > array2[right]
        reult << array2[right]
        right += 1
      else
        result << array1[left]
        result << array2[right]
        left += 1
        right += 1
      end
    end

    if left == array1.size
      result = result + array2[right..-1]
    else
      result = result + array1[left..-1]
    end
    result

  end


  def self.mergesort(array)
    if array.size <= 1
      array
    else
      mid = array.size/ 2
      left= mergesort(array.take(mid))
      right = mergesort(array.drop(mid))
      merge(left, right)
    end
  end
end
