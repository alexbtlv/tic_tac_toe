module TicTacToe
	class Cell
		attr_accessor :value

		def initialize(value = "")
			@value = value
		end

		def taken?
			if self.value
				true
			else
				false
			end
		end
	end
end