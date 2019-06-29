class FavouriteController < ApplicationController
  def create
  	Favourite.create(number_id: params[:number_id], user_id: @current_user.id)

  	@numbers = Number.all
  	respond_to :js
  end

  def destroy
  	favourite = Favourite.where(number_id: params[:number_id], user_id: @current_user.id).first
  	puts "favourite: #{favourite.inspect}"
  	Favourite.destroy(favourite.id) unless favourite.nil?

  	@numbers = Number.all
  	respond_to :js
  end
end
