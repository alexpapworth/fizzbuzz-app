class Api::V1::FavouriteController < ApplicationController
	skip_before_action :verify_authenticity_token

	def show
		if params[:flag] == "id" || params[:flag] == "name"
			if params[:flag] == "id"
				user = User.find_by_id( params[:value] )
			elsif params[:flag] == "name"
				user = User.find_by_name( params[:value] )
			end

			if user.nil?
				render_user = []
			else
				render_user = user.as_json
				render_user["favourites"] = user.favourites.as_json
			end
			render json: render_user
		elsif params[:flag] == "number"
			number = Number.find_by_id( params[:value] )
			render json: number.nil? ? [] : number.favourites
		else
			if @current_user.nil?
				user = {api_message: "You sent an auth_token that didn't match any user sessions. Please create a new session and try again"}
			else
				user = @current_user.as_json
				user["favourites"] = @current_user.favourites.as_json
			end
			render json: user
		end
	end

	def create
		if @current_user.nil?
			user = {api_message: "You sent an auth_token that didn't match any user sessions. Please create a new session and try again"}
		else
			Number.where( id: params[:value], result: helpers.check_fizzbuzz( params[:value] ) ).first_or_create
			favourite = Favourite.where( number_id: params[:value], user_id: @current_user.id ).first_or_create
			render json: favourite
		end
	end

	def destroy
		if @current_user.nil?
			user = {api_message: "You sent an auth_token that didn't match any user sessions. Please create a new session and try again"}
		else
			favourite = Favourite.where( number_id: params[:value], user_id: @current_user.id ).first
			Favourite.destroy( favourite.id ) unless favourite.nil?

			number = Number.find_by( id: params[:value] )
			if !number.nil? && number.favourites.count == 0
				Number.destroy( number.id )
			end
			render json: []
		end
	end
end
