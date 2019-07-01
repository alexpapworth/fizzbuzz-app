class Api::V1::SessionController < ApplicationController
	skip_before_action :verify_authenticity_token

	def show
		if @current_user.nil?
			user = {api_message: "You sent an auth_token that didn't match any user sessions. Please create a new session and try again"}
		else
			user = @current_user.as_json
			user["auth_token"] = cookies[:auth_token]
		end
		render json: user
	end

	def create
		if params[:flag] == "id"
			user = User.find_by_id( params[:value] )
		elsif params[:flag] == "name"
			user = User.find_by_name( params[:value] )
		end
		puts "user: #{user.inspect}"
		if user.nil? 
			token = {api_message: "You requested a user that doesn't exist. Please choose a new user and try again"}
		else
			token = {auth_token: create_session(user)}
		end
		render json: token
	end

	def destroy
		if @current_user.nil?
			user = {api_message: "You sent an auth_token that didn't match any user sessions. Please create a new session and try again"}
		else
			session = Session.find_by_auth_token(cookies[:auth_token])
		  	session.destroy
			user = @current_user.as_json
			user["auth_token"] = []
		end
		render json: user
	end
end
