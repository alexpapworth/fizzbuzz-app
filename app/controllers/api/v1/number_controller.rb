class Api::V1::NumberController < ApplicationController
	def index
		page = params[:page] ? params[:page].to_i : 1
		size = params[:size] ? params[:size].to_i : 100

		page = 99999999999 if page > 100000000000
		size = 100 if size > 250 

		end_number = page * size
		start_number = end_number - size +1

		numbers = []
		start_number.upto(end_number) do |number|
			numbers << ( 
				Number.find_by( id: number ) ?
				Number.find_by( id: number ) :
				{ 
					id: number,
					result: helpers.check_fizzbuzz(number),
					created_at: DateTime.now,
					updated_at: DateTime.now
				}
			)
		end
		render json: numbers
	end

	def show
		if params[:flag] == "id"
			number = (
				Number.find_by( id: params[:value] ) ? 
				Number.find_by( id: params[:value] ) : 
				{ id: params[:value].to_i,
				  result: helpers.check_fizzbuzz(params[:value]),
				  created_at: DateTime.now,
				  updated_at: DateTime.now }
			)
			render json: number
		end
	end
end
