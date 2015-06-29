def fizzbuzz(min, max)
  $number = min
  $range = max

  while $number <= $range do
    if ( $number % 3 == 0 ) && ( $number % 5 == 0 )
      puts "FizzBuzz"
    elsif ( $number % 3 == 0 ) && !( $number % 5 == 0 )
      puts "Fizz"
    elsif !( $number % 3 == 0 ) && ( $number % 5 == 0 )
      puts "Buzz"
    else
      puts "#{$number}"
    end
    $number += 1
  end
end

fizzbuzz(25, 50)
fizzbuzz(1, 40)