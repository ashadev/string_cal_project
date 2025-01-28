class StringCalculator
	def add(str)
		return 0 if str.empty?

		if str.start_with?("//")
		    delimiter, str = str.split("\n", 2)
		    delimiter = delimiter[2..]
		    numbers = str.split(delimiter).map(&:to_i)
		else
			numbers = str.gsub("\n", ",").split(',').map(&:to_i)
		end

		negatives = numbers.select { |n| n < 0 }

	    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

	    numbers.sum
	end
end