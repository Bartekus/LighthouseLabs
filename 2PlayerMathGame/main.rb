require_relative 'game_engine'
require 'colorize'

@game = GameEngine.new

greeting1       = lambda { print "\n\n\t\tWelcome to the Lighthouse Labs Math Game 9000".colorize(:light_red) }
greeting2       = lambda { print "\n\n\t\tHow many players will part take in this game? : ".colorize(:light_cyan) }
play_text1      = lambda { print "\n\n\t\tEnter the name of the player ".colorize(:light_yellow) }
play_text2      = lambda { print "\n\n\t\tor press enter to use the default name: ".colorize(:light_yellow) }
gameover_text1  = lambda { print "\n\n\t\t\t\tGAME-OVER!\n\n\t\t\t\t".colorize(:red) }
gameover_text2  = lambda { print " has won the game with top score of ".colorize(:red) }
question_text   = lambda { print "\n\n\t\tPlease resolve the following equation: ".colorize(:light_yellow) }
p_q_text1       = lambda { print "\n\n\t\tWhat is your answer ".colorize(:blue) }
p_q_text2       = lambda { print "\n\t\tThank you for your answer ".colorize(:light_blue) }
resolution_text = lambda { print "\n\n\t\tNow is the time to check the answers!\n\n\t\t".colorize(:light_yellow) }
correct_text    = lambda { print " that is correct!\n\t\t".colorize(:green) }
incorrect_text  = lambda { print " that is incorrect!\n\t\t".colorize(:red) }
answer_text     = lambda { print "\n\t\tThe correct answer was ".colorize(:light_yellow) }
score_text      = lambda { print "\n\n\t\tLet's take a look at the scoreboard!\n\n\t\t".colorize(:light_yellow) }
p_score_text1   = lambda { print " currently has score of ".colorize(:light_yellow) }
p_score_text2   = lambda { print " and ".colorize(:light_yellow) }
p_score_text3   = lambda { print " lives remaining!\n\t\t".colorize(:light_yellow) }
continue_text   = lambda { print "\n\n\t\tType 'y' or 'yes' to continue or press Enter to cancel: " }


@game.initialize_game(greeting1, greeting2, play_text1, play_text2, continue_text, gameover_text1, gameover_text2)
@game.loop(question_text, p_q_text1, p_q_text2, resolution_text, correct_text, incorrect_text, answer_text, score_text, p_score_text1, p_score_text2, p_score_text3, continue_text)
