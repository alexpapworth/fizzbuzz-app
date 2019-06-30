class WelcomeController < ApplicationController
	def index
		@numbers = []
		1.upto(100) do |number|
			@numbers << ( Number.find_by( id: number ) ? Number.find_by( id: number ) : PseudoNumber.new(
				number, helpers.check_fizzbuzz(number), [], []
			) )
		end
	end
end
