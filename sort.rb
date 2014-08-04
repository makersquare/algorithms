module Sort

  def self.selection_sort(array)
    #array.sort

    temp_num = 0
    min_num = 0
    min_index=0

    for h in 0...array.length
        min_num = array[h]
      for i in h...array.length-1
        if array[i+1]<min_num
          min_num = array[i+1]
          min_index = i+1
        end
      end
      temp_num = array[h]
      array[h] = min_num
      array[min_index] = temp_num
    end
    array
  end

  def self.countdown(n)
    puts n
    countdown(n-1) if n >0
  end

  def self.fizzbuzz(n)
    fizzbuzz(n-1) if n>0
    puts n%3==0 && n!=0 ? "fizz" : n%5==0 && n!=0 ? "buzz" : n
  end

  def self.exp(a,b)
    return 1 if b<=0
    a*exp(a,b-1)
  end

  def self.collatz(n)
    puts n
    return if n==1
    return collatz(n/2) if n%2 == 0 
    collatz(3*n+1)
  end


end