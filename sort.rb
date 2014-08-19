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
    return [] if arr.empty?
    mid = arr.length/2
    array1 = Sort.mergesort(arr[0..mid-1])
    array2 = Sort.mergesort(arr[mid..-1])
    Sort.merge(array1, array2)
  end

  def self.merge(array1, array2) #helper method for Merge Sort
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


  def self.binary_search(sorted_array, search_element)
    mid = sorted_array.length/2
    value = sorted_array[mid]
    return true if value == search_element
    sol = Sort.binary_search(sorted_array[0..mid-1], search_element) if  value > search_element
    sol = Sort.binary_search(sorted_array[mid+1..-1], search_element) if  value < search_element  
    sol  
  end
end

class Fibonacci
  @cache = [0, 1, 1, 2]
  
  def self.it_fib(n)
    return 1 if n<= 2
    x = y = 1
    (3..n).each { |_| y, x = y+x, y}
    y
  end

  def self.rec_fib(n)
    return 1 if n <= 2
    Sort.rec_fib(n-1) + Sort.rec_fib(n-2)
  end

  def self.cache_rec_fib(n)
    if !@cache[n] 
      p n
      n1 = @cache[n-1] ||= Sort.cache_rec_fib(n-1)
      n2 = @cache[n-2] ||= Sort.cache_rec_fib(n-2)
      @cache[n] = n1 + n2
    end
    @cache[n]
  end
end