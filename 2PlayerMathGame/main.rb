require_relative 'game_engine'
require 'colorize'

@game = GameEngine.new

greeting       = lambda do
  print "\n\n\t\tWelcome to the Lighthouse Labs Math Game 9000".colorize(:light_red)
  print "\n\n\t\tHow many players will part take in this game? : ".colorize(:light_cyan)
end

play_text       = lambda { |name| print "\n\n\t\tEnter the name of the player #{name} or press enter to use the default name: ".colorize(:light_yellow) }

gameover_text  = lambda { |name, score| print "\n\n\t\t\t\tGAME-OVER!\n\n\t\t\t\t#{name} has won the game with top score of #{score}!".colorize(:red) }

question_text   = lambda { |question| print "\n\n\t\tPlease resolve the following equation: #{question}".colorize(:light_yellow) }

p_q_text1       = lambda { |name| print "\n\n\t\tWhat is your answer #{name}".colorize(:blue) }
p_q_text2       = lambda { |name| print "\n\t\tThank you for your answer #{name}".colorize(:light_blue) }

resolution_text = lambda { print "\n\n\t\tNow is the time to check the answers!\n\n\t\t".colorize(:light_yellow) }
correct_text    = lambda { |name| print "#{name} that is correct!\n\t\t".colorize(:green) }
incorrect_text  = lambda { |name| print "#{name} that is incorrect!\n\t\t".colorize(:red) }
answer_text     = lambda { |answer| print "\n\t\tThe correct answer was #{answer}".colorize(:light_yellow) }
score_text      = lambda { print "\n\n\t\tLet's take a look at the scoreboard!\n\n\t\t".colorize(:light_yellow) }

p_score_text    = lambda { |name, score, lives| print "#{name} currently has score of #{score} and #{lives} lives remaining!\n\t\t".colorize(:light_yellow) }

continue_text   = lambda { print "\n\n\t\tType 'y' or 'yes' to continue or press Enter to cancel: " }


@game.initialize_game(greeting, play_text, continue_text, gameover_text)
@game.loop(question_text, p_q_text1, p_q_text2, resolution_text, correct_text, incorrect_text, answer_text, score_text, p_score_text, continue_text)


# Gotta remake this using ERB's
