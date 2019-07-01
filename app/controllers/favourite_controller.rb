class FavouriteController < ApplicationController
	def create
		Number.create( id: params[:number_id], result: helpers.check_fizzbuzz( params[:number_id] ) ) unless Number.find_by( id: params[:number_id] )
		favourite = Favourite.create( number_id: params[:number_id], user_id: @current_user.id )

		@number = favourite.number
		respond_to :js
	end

	def destroy
		favourite = Favourite.where( number_id: params[:number_id], user_id: @current_user.id ).first
		puts "favourite: #{favourite.inspect}"
		Favourite.destroy( favourite.id ) unless favourite.nil?

		number = Number.find_by( id: params[:number_id] )
		if number.favourites.count == 0
			Number.destroy( number.id )
			@number = PseudoNumber.new( params[:number_id], helpers.check_fizzbuzz(params[:number_id]), [], [] ) 
		else
			@number = favourite.number
		end

		respond_to :js
	end
end
