require "spec_helper"

describe Array do
	context "#all_empty" do
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
end