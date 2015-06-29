# Save this file to your computer so you can run it
# via the command line (Terminal) like so:
#   $ ruby shakil_the_dog.rb
#
# Your method should wait for user input, which corresponds
# to you saying something to your dog (named Shakil).
 
# You'll probably want to write other methods, but this 
# encapsulates the core dog logic

def shakil_talk(userinput)
  case userinput
    when 'woof' then puts 'WOOF WOOF WOOF'
    when 'shakil stop', 'Shakil STOP!' then puts '*crickets chirping*' 
    when 'meow' then puts 'woof woof woof woof woof'
    when /treat/ then puts '*Shakil looks at you as if he was expecting something... Hmm*'
    when 'go away' then @terminated = true 
    else puts "I didn't get that, come again?"
  end
end

def shakil_input
  input = gets.chomp
end

def shakil_the_dog
  @terminated = false
  until @terminated
    puts "\nShakil looks at you awaiting your command, what say you?"
    shakil_talk(shakil_input) 
  end
  puts "Good Bye!"
end

shakil_the_dog