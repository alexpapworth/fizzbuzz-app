class User < ApplicationRecord
	has_many :favourites, :dependent => :delete_all 
	has_many :numbers, through: :favourites
	has_many :sessions, :dependent => :delete_all 
end
