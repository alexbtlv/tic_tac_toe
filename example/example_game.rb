require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"

bonnie = TicTacToe::Player.new({color: "X", name: "bonnie"})
clyde = TicTacToe::Player.new({color: "O", name: "clyde"})
players = [bonnie, clyde]
TicTacToe::Game.new(players).play