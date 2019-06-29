class ApplicationController < ActionController::Base
	
	before_action :current_user

	private
		def current_user
			session = Session.find_by_auth_token(cookies[:auth_token])
			@current_user ||= session.user unless session.nil?
		end

		def create_session(user)
			begin
				token = SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64
				user.sessions.create(auth_token: token)
				cookies.permanent[:auth_token] = token
			end unless Session.find_by_auth_token( token )
		end

		helper_method :current_user
end
