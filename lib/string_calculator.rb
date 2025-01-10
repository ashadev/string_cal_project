class StringCalculator
	def add(numbers)
		return 0 if numbers.empty?

		if numbers.start_with?("//")
			delimiter, numbers = numbers[2..].split("\n", 2)
			num = numbers.split(delimiter).map(&:to_i)
		else
			num = numbers.gsub("\n", ",").split(",").map(&:to_i)
		end

		neg = num.select(&:negative?)
		raise "Negative numbers are not allowed: #{neg.join(', ')}" unless neg.empty?

		num.inject(0, :+)
	end
end