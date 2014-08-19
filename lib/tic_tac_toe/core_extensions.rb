class Array
	def all_empty?
		self.all? { |element| element.to_s.empty? }
	end

	def all_same?
		self.all? { |element| element == self[0] }
	end
end