class User < ApplicationRecord
	has_many :favourites
	has_many :numbers, through: :favourites
	has_many :sessions
end
