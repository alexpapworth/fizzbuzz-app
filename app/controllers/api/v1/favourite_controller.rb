class Api::V1::FavouriteController < ApplicationController
	def show
		puts cookies[:auth_token]
		if params[:flag] == "id"
			user = User.find_by_id( params[:value] )
			render json: user.nil? ? [] : user.favourites
		elsif params[:flag] == "name"
			user = User.find_by_name( params[:value] )
			render json: user.nil? ? [] : user.favourites
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
			# current user
		end
	end

	def create
	end

	def destroy
	end
end
