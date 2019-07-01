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

		PseudoNumber = Struct.new(:id, :result, :favourites, :users)
		
		def generate_numbers start_number, end_number
			@numbers = []
			start_number.upto(end_number) do |number|
				@numbers << ( Number.find_by( id: number ) ? Number.find_by( id: number ) : PseudoNumber.new(
					number, helpers.check_fizzbuzz(number), [], []
				) )
			end
		end
		
		helper_method :current_user
end
