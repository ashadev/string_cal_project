require 'string_calculator'

RSpec.describe StringCalculator do
	describe '#add' do
		it 'return 0 for empty string' do
			expect(StringCalculator.new.add("")).to eq(0)
		end

		it 'returns the number itself for a single number' do
	      expect(StringCalculator.add("1")).to eq(1)
	    end

	    context 'when comma is the delimiter' do
	    	it 'returns the sum of two numbers' do
		      expect(StringCalculator.add("1,2")).to eq(3)
		    end

		    it 'returns the sum of multiple numbers' do
	  			expect(StringCalculator.add("1,2,3,4")).to eq(10)
			end
	    end

		context 'when \n is the delimiter' do
			it 'returns the sum of multiple numbers' do
	  			expect(StringCalculator.add("1\n2,3")).to eq(6)
			end
		end 
	end
end

