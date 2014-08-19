module Recursive
  
  def self.countdown(n)
    puts n
    self.countdown(n-1) if n>0
  end

  def self.fizzbuzz(n)
    self.fizzbuzz(n-1) if n>0
    if n==0
      puts n
    elsif n%3 == 0 && n%5 == 0
      puts "fizzbuzz"
    elsif n%3 == 0
      puts "fizz"
    elsif n%5 == 0
      puts "buzz"
    else
      puts n
    end
  end

  def self.exponential(a,b)
    return 1 if b == 0
    if b > 0
      self.exponential(a, b-1) * a
    elsif b < 0
      # We have two correct answers!
      # self.exponential(a.to_f, b+1)/a
      1.0/(self.exponential(a,-b))
    end
  end

  def self.three_n_plus_one(n)
    puts n
    if n % 2 == 0
      self.three_n_plus_one(n/2)
    elsif n>1
      self.three_n_plus_one(3*n + 1)
    end
  end

      
end
