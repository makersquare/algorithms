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

  end

end
