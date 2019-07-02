class Api::V1::UserController < ApplicationController
	skip_before_action :verify_authenticity_token

	def show
		if params[:flag] == "id"
			user = User.find_by_id( params[:value] )
			render json: user.nil? ? [] : user
		elsif params[:flag] == "name"
			user = User.find_by_name( params[:value] )
			render json: user.nil? ? [] : user
		else
			render json: User.all
		end
	end

	def create
		if params[:flag] == "name"
			user = User.create(name: params[:value] )
		else
			user = User.create(name: helpers.generate_username)
		end
		render json: user
	end

	def destroy
		if params[:flag] == "id"
			user = User.find_by_id( params[:value] )
		elsif params[:flag] == "name"
			user = User.find_by_name( params[:value] )
		end
		user.destroy unless user.nil?
		render json: []
	end
end
