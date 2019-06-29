class ApplicationController < ActionController::Base
	
	before_action :current_user

	private
		def current_user
			@current_user ||= Session.find_by_auth_token(cookies[:auth_token]).user if cookies[:auth_token]
		end

		helper_method :current_user
end
