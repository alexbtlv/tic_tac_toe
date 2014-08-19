require "spec_helper"

describe Array do
	context "#all_empty?" do
		it "returns true if all elements of the array are empty" do
			expect(["", "", ""].all_empty?).to be_truthy
		end

		it "returns false if some the Array elements are not empty" do
			expect(["yo", "", ""].all_empty?).to  be_falsey
		end

		it "returns true for an empty array" do
			expect([].all_empty?).to be_truthy
		end
	end

	context "#all_same?" do
		it "returns true if all elements of the array are the same" do
			expect(["Yo", "Yo", "Yo"].all_same?).to be_truthy  
		end

		it "returns false if some of the array elements are not the same" do
			expect(["Yo", " ", " "].all_same?).to be_falsey
		end

		it "returns true for an empty array" do
			expect([].all_same?).to be_truthy
		end
	end

	context "#any_empty?" do
		it "returns true if there are any empty elements in array" do
			expect(["yo", "", "Boom"].any_empty?).to be_truthy
		end

		it "returns false if there no empty elements in array" do
			expect(["yo", "yo", "Boom"].any_empty?).to be_falsey
		end

		it "returns false for an empty array" do
			expect([].any_empty?).to be_falsey
		end
	end

	context "#none_empty?" do
		it "returns true if there are no empty elements in array" do
			expect(["X", "X", "O"].none_empty?).to be_truthy
		end

		it "returns false if there are empty elements in array" do
			expect(["X", "X", ""].none_empty?).to be_falsey
		end

		it "returns true for an empty array" do
			expect([].none_empty?).to be_truthy
		end		
	end
end










