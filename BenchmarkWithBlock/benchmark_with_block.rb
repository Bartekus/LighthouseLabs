def benchmark(name = 'unknown', res = false, &block)
  begin
    start_time = Time.now
    result = yield
    finish_time = Time.now
    runtime = finish_time - start_time
  ensure
    if res
      puts "The process #{name} took #{runtime} seconds to run and produced the following result: #{result}"
    else
      puts "The process #{name} took #{runtime} seconds to run"
    end
  end
end

############################################################################################################################
# Task 1

long_string = "apple"*100000000

benchmark(name = 'Long String') { long_string.reverse }


############################################################################################################################
# Testing Calculate the 33th Fibonacci number

def fibonacci( n )
  return  n  if n <= 1
  fibonacci( n - 1 ) + fibonacci( n - 2 )
end

benchmark(name = 'Fibonacci(33)', res = true) { fibonacci(33) }
