class FavouriteController < ApplicationController
	def create
		Number.where( id: params[:number_id], result: helpers.check_fizzbuzz( params[:number_id] ) ).first_or_create

		if @current_user.nil?
			@current_user = User.create(name: helpers.generate_username)
		  	create_session(@current_user)

			favourite = Favourite.create( number_id: params[:number_id], user_id: @current_user.id )
		  	redirect_to root_url
		else
			favourite = Favourite.create( number_id: params[:number_id], user_id: @current_user.id )
			@number = favourite.number
			respond_to :js
		end
	end

	def destroy
		favourite = Favourite.where( number_id: params[:number_id], user_id: @current_user.id ).first
		Favourite.destroy( favourite.id ) unless favourite.nil?

		number = Number.find_by( id: params[:number_id] )
		if !number.nil? && number.favourites.count == 0
			Number.destroy( number.id )
			@number = PseudoNumber.new( params[:number_id], helpers.check_fizzbuzz(params[:number_id]), [], [] ) 
		else
			@number = favourite.number
		end

		respond_to :js
	end
end
