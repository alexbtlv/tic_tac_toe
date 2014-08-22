require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"

puts "Plese enter name for a first player"
@name1 = gets.chomp
puts "Plese enter name for a second player"
@name2 = gets.chomp

TicTacToe::Board.new.display_positions

puts "\n >> PLEASE SEE THE POSITIONS OF THE BOARD << \n\n"

player_1 = TicTacToe::Player.new({color: "X", name: @name1})
player_2 = TicTacToe::Player.new({color: "O", name: @name2})
players = [player_1, player_2]

TicTacToe::Game.new(players).play