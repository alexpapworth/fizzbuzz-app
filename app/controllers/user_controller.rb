class UserController < ApplicationController
  def create
  	@current_user = User.create(name: helpers.generate_username)
  	create_session(@current_user)

  	redirect_to root_url
  end
end
