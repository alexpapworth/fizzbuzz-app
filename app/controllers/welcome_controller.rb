class WelcomeController < ApplicationController
  def index
  	@numbers = Number.all
  end
end
