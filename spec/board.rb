require "spec_helper"

module TicTacToe
	describe Board do
		
		context "#initialize" do
			it "initilizes the board with a grid" do
				expect{ Board.new(grid: "grid") }.to_not raise_error
			end

			it "sets the grid with three rows by default" do
				board = Board.new
				expect(board.grid.size).to eq(3)
			end

			it "creates three cells in each row" do
				board = Board.new
				board.grid.each do |row|
					expect(row.size).to eq(3)
				end
			end
		end

		context "#grid" do
			it "returns the grid" do
				board = Board.new(grid: "yo")
				expect(board.grid).to eq "yo"
			end
		end

		context "#get cell" do
			it "returns the cell based on the (x, y) coordinates" do
				grid = [['', '', ''], ['', '', ''], ['', '', 'yo']]
				board = Board.new(grid: grid)
				expect(board.get_cell(2,2)).to eq('yo')
			end
		end

		context "#set cell" do
			it "updates the value of the cell object at x and y coordinates" do
				Cat = Struct.new(:value)
				grid = [[Cat.new("yo"), "", ""], ["", "", ""], ["", "", ""]]
				board = Board.new(grid: grid)
				board.set_cell(0, 0, "Hi")
				expect(board.get_cell(0,0).value).to eq("Hi")
			end
		end

		context "#game over" do
			TestCell = Struct.new(:value)
			let(:x_cell) { TestCell.new("X") }
			let(:y_cell) { TestCell.new("Y") }
			let(:empty) { TestCell.new }

			it "returns :winner if winner? is true" do
				board = Board.new
				board.stub(:winner?) { true }
				expect(board.game_over).to eq :winner
			end

			it "returns :draw if winner? is false and draw? is true" do
				board = Board.new
				board.stub(:winner?) { false }
				board.stub(:draw?) { true }
				expect(board.game_over).to eq :draw
			end

			it "returns false if winner? is false and :draw is false" do
				board = Board.new
				board.stub(:winner?) { false }
				board.stub(:draw?) { false }
				expect(board.game_over).to be_falsey
			end

			it "returns :winner when row has objects with values that are all the same" do
				grid = [
					[x_cell, x_cell, x_cell],
					[y_cell, x_cell, y_cell],
					[y_cell, y_cell, empty]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :winner when diagonal has objects with values that are all the same" do
				grid = [
					[x_cell, x_cell, empty],
					[y_cell, x_cell, y_cell],
					[y_cell, y_cell, x_cell]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :winner when column has objects with same values" do
				grid = [
					[x_cell, x_cell, empty],
					[y_cell, x_cell, y_cell],
					[y_cell, x_cell, y_cell]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :draw when all spaces on the board are taken" do
			    grid = [
			      [x_cell, y_cell, x_cell],
			      [y_cell, x_cell, y_cell],
			      [y_cell, x_cell, y_cell]
			    ]
			    board = Board.new(grid: grid)
			    expect(board.game_over).to eq :draw
			end
			 
			it "returns false when there is no winner or draw" do
			    grid = [
			      [x_cell, empty, empty],
			      [y_cell, empty, empty],
			      [y_cell, empty, empty]
			    ]
			    board = Board.new(grid: grid)
			    expect(board.game_over).to be_falsey
			end
		end
	end
end























