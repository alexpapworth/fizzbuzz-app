module ApplicationHelper
	def check_fizzbuzz(number)
		"#{"fizz" if number.to_i % 3 == 0}#{'buzz' if number.to_i % 5 == 0}".capitalize
	end
end
