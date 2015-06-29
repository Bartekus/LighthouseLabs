require_relative 'candidates'
require_relative 'filters'

@terminated = false

def to_human(format = multi, &block)
  case format
    when 'single'
      candidate = yield
      candidate.each { |key, value| print "#{key.capitalize}: #{value}\n" }
    when 'multi'
      candidates = yield
      candidates.each do |candidate|
        print "\nCandidate "
        candidate.each { |key, value| print "#{key.capitalize}: #{value}\n" }
        print "\n"
      end
  end
end

def candidates_main
  until @terminated
    print "\n"
    puts "Hello and welcome to The Candidates Program!"
    puts "Here are your options:"
    print "\n"
    puts "To find candidate with id #1 type: find 1"
    puts "To list all candidates please type: all"
    puts "To print only the qualified, ordered by experience and points, one per line, type: qualified"
    puts "To exit, please type: quit"
    print "\n"
    print "What is your command: "
    input = gets.chomp!

    split    = input.split(/ /)
    command  = split.first.to_s
    argument = split.last.to_s.to_i

    case command
      when "find" then to_human(format = 'single') { find(argument) }
      when "all" then to_human(format = 'multi') { all }
      when "qualified" then to_human(format = 'multi') { order_by_qualifications(@candidates) }
      when "quit" then @terminated = true
      else puts "Invalid command"
    end
  end
end

candidates_main
