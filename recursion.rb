def fizzbuzz(num)
  return num if num == 0
  fizzbuzz(num - 1)
  if num % 5 == 0 && num % 3 == 0
    puts "FizzBuzz"
  elsif num % 5 == 0
    puts "Buzz"
  elsif num % 3 == 0
    puts "Fizz"
  else
    puts num
  end
end



def exp(x, y)
  return x if y == 1
  x * exp(x, y - 1)
end



def three_n(num)
  puts num
  return num if num <= 1
  if num % 2 != 0
    num = (3 * num) + 1
  else
    num = num / 2
  end
  three_n(num)
end




