class UserController < ApplicationController
  def create
  	@current_user = User.create(name: helpers.generate_username)
  	generate_token(@current_user)

  	respond_to :js
  end

  private
  	def generate_token(user)
			begin
				token = SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64
				user.sessions.create(auth_token: token)
				cookies.permanent[:auth_token] = token
			end unless Session.find_by_auth_token( token )
		end
end
