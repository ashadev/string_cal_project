require 'string_calculator'

RSpec.describe StringCalculator do
	describe '#add' do
		it 'return 0 for empty string' do
			expect(StringCalculator.new.add("")).to eq(0)
		end

		it 'return 0 for string having nil' do
			expect(StringCalculator.new.add("nil")).to eq(0)
		end

		context 'when there is one number' do
			it 'return that number itself' do
				expect(StringCalculator.new.add("1")).to eq(1)
			end
		end

		context 'when comma is a delimiter' do
			it 'returns sum of two numbers' do
				expect(StringCalculator.new.add("1,2")).to eq(3)
			end

			it 'returns sum of multiple numbers' do
				expect(StringCalculator.new.add("1,2,3,4,5")).to eq(15)
			end
		end

		context 'when new line is delimiter' do
			it 'returns sum of numbers' do
				expect(StringCalculator.new.add("1\n2")).to eq(3)
			end

			it 'returns sum of multiple numbers' do
				expect(StringCalculator.new.add("1\n2\n3")).to eq(6)
			end
		end

		context 'when custom delimiter is given' do
			it 'returns sum of numbers' do
				expect(StringCalculator.new.add("//;\n1;2")).to eq(3)
			end
		end

		context 'when invalid custom delimiter is given after delimiter' do
			# delimiter is ; but along with ; if other delimiter is given it will not consider rest
			it 'returns sum of numbers of valid delimiter' do
				expect(StringCalculator.new.add("//;\n1;2;3:4")).to eq(6)
			end
		end

		it 'will raises an exception for negative number' do
			expect { StringCalculator.new.add("1,-2,-3") }.to raise_error(RuntimeError, "Negative numbers are not allowed: -2, -3")
		end
	end
end

