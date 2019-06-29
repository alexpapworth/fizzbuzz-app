class SessionController < ApplicationController
  def destroy
  	session = Session.find_by_auth_token(cookies[:auth_token])
  	@current_user = nil
	cookies.delete(:auth_token)
	session.destroy

	respond_to :js
  end
end
