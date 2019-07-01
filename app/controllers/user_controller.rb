class UserController < ApplicationController
  def create
  	@current_user = User.create(name: helpers.generate_username)
  	create_session(@current_user)

  	respond_to :js
  end
end
