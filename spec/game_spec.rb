require "spec_helper"

module TicTacToe
	describe Game do
		
		let(:clyde) { Player.new({color: "X", name: "clyde"}) }
		let(:bonnie) { Player.new({color: "X", name: "bonnie"}) }

		context "#initialize" do
			it "randomly select current player" do
				Array.any_instance.stub(:shuffle) { [:bonnie, :clyde] }
				game = Game.new([:bonnie, :clyde])
				expect(game.current_player).to eq :bonnie
			end

			it "randomly select other player" do
				Array.any_instance.stub(:shuffle) { [:bonnie, :clyde] }
				game = Game.new([:bonnie, :clyde])
				expect(game.other_player).to eq :clyde
			end
		end

		context "#switch players" do
			it "will set @current_player to @other_player" do
				game = Game.new([:bonnie, :clyde])
				other_player = game.other_player
				game.switch_players
				expect(game.current_player).to eq other_player
			end

			it "will set @other_player to @current_player" do
				game = Game.new([:bonnie, :clyde])
				current_player = game.current_player
				game.switch_players
				expect(game.other_player).to eq current_player
			end
		end

		context "#solicit_move" do
			it "asks the player to make a move" do
				game = Game.new([:bonnie, :clyde])
				game.stub(:current_player) { bonnie }
				expected = "bonnie: Enter a number between 1 and 9 to make your move"
				expect(game.solicit_move).to eq expected
			end
		end

		context "#get_move" do
			it "converts human_move of '1' to [0, 0]" do
				game = Game.new([:bonnie, :clyde])
				expect(game.get_move("1")).to eq [0, 0] 
			end

			it "converts human_move of '9' to [2, 2]" do
			    game = Game.new([:bonnie, :clyde])
			    expect(game.get_move("9")).to eq [2, 2]
			end
		end

		context "#game_over_message" do
			it "returns '{current_player name} won!' if board has a winner" do
				game = Game.new([:bonnie, :clyde])
				game.stub(:current_player) { bonnie }
				game.board.stub(:game_over) { :winner }
				expect(game.game_over_message).to eq "bonnie won!"
			end

			it "returns 'The game ended in a tie' if board shows a draw" do
			    game = Game.new([:bonnie, :clyde])
			    game.stub(:current_player) { bonnie }
			    game.board.stub(:game_over) { :draw }
			    expect(game.game_over_message).to eq "The game ended in a tie"
			end
		end
	end
end











