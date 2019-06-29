class ApplicationController < ActionController::Base
	
	before_action :current_user

	private
		def current_user
			session = Session.find_by_auth_token(cookies[:auth_token])
			@current_user ||= session.user unless session.nil?
		end

		helper_method :current_user
end
