class SessionController < ApplicationController

  def new
  end

  def create
  	@current_user = User.find_by_name(params[:name])
  	create_session(@current_user)
  	redirect_to root_url
  end

  def destroy
  	session = Session.find_by_auth_token(cookies[:auth_token])
  	@current_user = nil
  	cookies.delete(:auth_token)
  	session.destroy

	  redirect_to root_url
  end
end
