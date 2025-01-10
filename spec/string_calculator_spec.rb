require 'string_calculator'

RSpec.describe StringCalculator do
	describe '#add' do
		it 'return 0 for empty string' do
			expect(StringCalculator.new.add("")).to eq(0)
		end

	end
end

