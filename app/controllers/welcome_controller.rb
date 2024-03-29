class WelcomeController < ApplicationController
	
	protect_from_forgery except: [:page_size]

	def index
		@page = params[:page] ? params[:page].to_i : 1
		@size = params[:size] ? params[:size].to_i : 100

		@page = 1000000000 if @page > 1000000000
		@size = 100 if @size > 250 

		end_number = @page * @size
		start_number = end_number - @size +1

		generate_numbers(start_number, end_number)
	end

	def page_size
		start_number = params[:start_number].to_i
		end_number = start_number + params[:size].to_i

		@size = params[:size].to_i
		@page = end_number / @size

		puts "start_number #{start_number}"
		puts "end_number #{end_number}"

		generate_numbers(start_number, end_number)

		respond_to :js
	end
end
